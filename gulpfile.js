

// Plugins
var gulp = require('gulp'),
    del = require('del'),
    rename = require('gulp-rename'),
    concat = require('gulp-concat'),

    browserSync = require('browser-sync'),
    runSequence = require('run-sequence'),
    plumber = require('gulp-plumber'),

    swig = require('gulp-swig'),
    data = require('gulp-data'),
    fs = require('fs'),
    fm = require('front-matter'),
    minifyHTML = require('gulp-minify-html'),

    sass = require('gulp-sass'),
    cssGlobbing = require('gulp-css-globbing'),
    sourcemaps = require('gulp-sourcemaps'),
    postcss = require('gulp-postcss'),
    autoprefixer = require('autoprefixer-core'),
    minifyCSS = require('gulp-minify-css'),
    uncss = require('gulp-uncss'),

    uglify = require('gulp-uglify'),

    imageResize = require('gulp-image-resize'),
    newer = require('gulp-newer'),
    shell = require('gulp-shell'),

    path = require('path'),
    inflection = require( 'inflection' );



// Folders and files
var paths = {
  // .swig source files
  swig_src: ['components/**/*.swig'],

  // .swig dest files (same directory)
  swig_dest: 'components',

  // global config.json file
  config_json: './site/config.json',

  // Styleguide global config.json file
  styleguide_config_json: './styleguide/config.json',




  // .html files from to be moved into dest
  html_src: 'components/pages/**/**/*.html',

  // the destination folder
  dest: 'dist',




  // .scss file to compile
  scss_src: 'assets/styles/site.scss',

  // .scss file to compile for /styleguide
  styleguide_scss_src: 'assets/styles/styleguide.scss',

  // .css file destination
  scss_dest: 'dist/assets/styles',

  // .css file destination for styleguide
  styleguide_scss_dest: 'dist/styleguide/assets/styles',




  // .js files to concat
  js_src: ['site/components/framework/**/**/*.js', 'site/components/project/**/**/*.js', 'site/components/framework/pages/**/**/*.js]'],

  // .js minimezed file name
  js_filename: 'site.js',

  // .js file destination
  js_dest: 'dist/assets/scripts',


  // .js files to concat for styleguide
  styleguide_js_src: ['styleguide/components/framework/**/**/*.js', 'styleguide/components/project/**/**/*.js', 'styleguide/components/framework/pages/**/**/*.js]'],

  // .js minimezed file name for styleguide
  styleguide_js_filename: 'styleguide.js',

  // .js file destination for styleguide
  styleguide_js_dest: 'dist/styleguide/assets/scripts',


  // .js files to move
  js_move_src: 'site/assets/scripts/**/*.js',

  // .js files to move destination
  js_move_dest: 'dist/assets/scripts',




  // where to resize images
  image_resize_dest: 'site/assets/images/resized',

  // images to resize and optimize
  images_resize_src: 'site/assets/images/*.png',

  // images to move
  images_src: 'site/assets/images/*.{png,jpg,mp4,webm}',

  // images destination
  images_dest: 'dist/assets/images',


  // clean path
  clean: ['dist/**/*'],


  // watch these files for changes
  watch: ['site/**/*.{swig,json,scss,js}', 'styleguide/**/*.{swig,json,scss,js}']
};



// Error handling
var onError = function(error) {
  console.log(error.message)
  this.emit('end');
};



// Resize a single image with ImageMagick
var _image_resize = function(file, size, name) {
  console.log("Resizing image " + file + " to " + size);
  gulp.src(file)
    .pipe(plumber({errorHandler: onError}))
    .pipe(imageResize({
      width : size,
      sharpen: true,
      imageMagick: true
    }))
    .pipe(rename(function (path) { path.basename += "_" + name; }))
    .pipe(gulp.dest(paths.image_resize_dest));
}


// Resize a bunch of images
var _image_batch_resize = function(files, retina, retina_name) {
  return gulp.src(files)
    .pipe(plumber({errorHandler: onError}))
    .pipe(newer(paths.images_dest))
    .pipe(data(function(file) {
      json_file = file.path.replace('.png', '.json');
      if (fs.existsSync(json_file)) {
        json = require(json_file);
        sizes = json.image_sizes;
        for (i in sizes) {
          _image_resize(file.path, sizes[i].width * retina, sizes[i].name + retina_name);
        }
      }
    }))
}


// Image resize
// - create different images for different devices
gulp.task('image_resize', function() {
  _image_batch_resize(paths.images_resize_src, 1, '');
});


// Retina images
// - create 2x images for different devices
gulp.task('image_resize_2x', function() {
  _image_batch_resize(paths.images_resize_src, 2, '2x');
});


// Optimize images
// - the gulp pngquant task gives an error
// - we use gulp shell to run pngquant manually
// - the old file will be overwritten instead of appending the usual 'fs8' suffix
gulp.task('image_optimize', function() {
  return gulp.src(paths.image_resize_dest + '/*.png')
    .pipe(plumber({errorHandler: onError}))
    .pipe(newer(paths.images_dest))
    .pipe(shell(['pngquant --ext .png --force <%= file.path %>']))
});


// Move resized and compressed images
// - collect all images and move to dist/assets/images
gulp.task('image_move', function() {
  return gulp.src(paths.image_resize_dest + '/*.png')
    .pipe(plumber({errorHandler: onError}))
    .pipe(newer(paths.images_dest))
    .pipe(gulp.dest(paths.images_dest));
});


// Move original images
// - collect all original images and move to dist/assets/images
// - original images are moved to make .changed() work
gulp.task('image_move_original', function() {
  return gulp.src(paths.images_src)
    .pipe(plumber({errorHandler: onError}))
    .pipe(newer(paths.images_dest))
    .pipe(gulp.dest(paths.images_dest));
});








// JS
// - collect all .js files into filename.js, then minify into filename.min.js, then move to dest
var _js = function(source, filename, dest) {
  return gulp.src(source)
    .pipe(plumber({errorHandler: onError}))
    .pipe(data(function(file) {
      //console.log("Merging " + file.path + " into site.min.js")
    }))
    .pipe(concat(filename))
    .pipe(rename({ suffix: '.min' }))
    .pipe(uglify())
    .pipe(gulp.dest(dest));
};

gulp.task('js', function() {
  _js(paths.js_src, paths.js_filename, paths.js_dest);
});

gulp.task('js_sg', function() {
  _js(paths.styleguide_js_src, paths.styleguide_js_filename, paths.styleguide_js_dest);
});




// Scripts
// - move (third party) scripts to dest
gulp.task('scripts', function() {
  return gulp.src(paths.js_move_src)
    .pipe(plumber({errorHandler: onError}))
    .pipe(gulp.dest(paths.js_move_dest));
});







// SCSS
// - import all scss files into site.scss. Folders will be imported in alphabetical order
// - compile site.scss with autoprefixer
// - remove unused CSS with uncss
// - minify and copy the site.css and the sourcemap to dist/assets/styles
var _scss = function(source, dest, html) {
  return gulp.src(source)
    .pipe(plumber({errorHandler: onError}))
    .pipe(cssGlobbing({
      extensions: ['.scss']
    }))
    .pipe(sourcemaps.init())
    .pipe(sass())
    .pipe(postcss([ autoprefixer() ]))
    //.pipe(uncss({ html: html }))
    .pipe(minifyCSS())
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest(dest));
}

gulp.task('scss', function(){
  _scss('site/' + paths.scss_src, paths.scss_dest, paths.html_src);
});

gulp.task('scss_sg', function(){
  _scss('styleguide/' + paths.styleguide_scss_src, paths.styleguide_scss_dest, paths.styleguide_html_src);
});







// HTML
// - minify and copy html files to dist
// - create seo friendly urls
var _html = function(source, dest) {
  return gulp.src(source)
    .pipe(plumber({errorHandler: onError}))
    .pipe(rename(function(path) {
      // rename home/home.html > index.html
      if (path.dirname == 'home') {
        path.dirname = '';
      }
      // rename work.html > index.html
      path.basename = 'index';
    }))
    .pipe(minifyHTML())
    .pipe(gulp.dest(dest));
}


gulp.task('html', function() {
  _html('site/' + paths.html_src, paths.dest);
});

gulp.task('html_sg', function() {
  _html('styleguide/' + paths.html_src, paths.dest + '/styleguide/');
});





// SWIG
// - compile swig files into html, scss or js. Each swig file has two extensions like colors.scss.swig or page.html.swig
// - process YAML Front Matter data, if any
// - load JSON data for every file. It looks for a same-name json file. colors.scss.swig will look for colors.scss.json
// - make available to /styleguide all JSON data from /site
var _swig = function(source, dest, config, grabJSON) {
  return gulp.src(source)
    .pipe(plumber({errorHandler: onError}))

    // use global JSON definitions from /site in /styleguide
    .pipe(data(function(file) {
      if (grabJSON) {
        components = file.path.replace('styleguide', 'site');
        json = components.split('.')[0] + '.scss.json';
        if (fs.existsSync(json)) {
          return require(json);
        }
      }
    }))

    // load menu.json for styleguide
    .pipe(data(function(file) {
      if (grabJSON) {
        json = './styleguide/components/project/menu/menu.html.json';
        if (fs.existsSync(json)) {
          return require(json);
        }
      }
    }))

    // use YAML Front Matter
    .pipe(data(function(file) {
      var content = fm(String(file.contents));
      file.contents = new Buffer(content.body);
      return content.attributes;
    }))

    // load JSONs
    .pipe(swig({
      // Load a same-name JSON file if found
      load_json: true,
      defaults: {
        cache: false,
        // Load site-wide JSON settings
        locals: {
          site: require(config)
        }
      }
    }))
    .pipe(rename({ extname: '' }))
    .pipe(gulp.dest(dest));
}


// Swig
gulp.task('swig', function() {
  _swig('site/' + paths.swig_src, 'site/' + paths.swig_dest, paths.config_json);
});

gulp.task('swig_sg', function() {
  _swig('styleguide/' + paths.swig_src, 'styleguide/' + paths.swig_dest, paths.styleguide_config_json, true);
});




// Styleguide tasks

// Create Menu
// - http://stackoverflow.com/questions/11194287/convert-a-directory-structure-in-the-filesystem-to-json-with-node-js
// - http://jsfiddle.net/BvDW3/

function dirTree(filename) {
  var stats = fs.lstatSync(filename);

  if (stats.isDirectory()) {
    var info = { path: filename, name: path.basename(filename) };
    info.children = fs.readdirSync(filename).map(function(child) {
      return dirTree(filename + '/' + child);
    });
  }

  return info;
}

function makeUL(lst) {
    var html = [];
    html.push('<ul>');
    for (var i = 0; i < lst.length; i++ ) {
      if (typeof lst[i] != 'undefined')
        html.push(makeLI(lst[i]));
    }
    html.push('</ul>');
    return html.join("\n");
}

function makeLI(elem) {
    var html = [];
    html.push('<li>');
    if (elem.path) {
      title = inflection.humanize(elem.name.replace('--', '').replace('__', ''));
      link = elem.path.replace('site/components/', '')
      html.push('<a class="link" title="' + title + '" href="' + link + '">' + title + '</a>');
    }
    if (elem.children)
      html.push(makeUL(elem.children));
    html.push('</li>');
    return html.join("\n");
}


gulp.task('sg_menu', function() {
  var json = dirTree('site/components/framework');
  var menu = makeUL([json]);
  fs.writeFileSync('styleguide/components/project/menu/__framework/menu__framework.html.swig', menu);

  json = dirTree('site/components/project');
  menu = makeUL([json]);
  fs.writeFileSync('styleguide/components/project/menu/__project/menu__project.html.swig', menu);
});




// Common tasks
//

// Clean destination folder
gulp.task('clean', function(cb) {
  del(paths.clean);
  cb();
});



// Resize, optimize and move images
gulp.task('images', function(cb) {
  runSequence(
    'image_resize',
    'image_resize_2x',
    'image_optimize',
    'image_move',
    'image_move_original',
    cb
  );
});


// The default task
// - runSequence makes sure all tasks are running one after another
// - otherwise Gulp is messing up everything with it's async task runner
gulp.task('default', function(cb) {
  runSequence(
    'swig',
    'html',
    'scss',
    'js',
    'scripts',
    'images',
    cb
  );
});


// The Styleguide task
gulp.task('sg', function(cb) {
  runSequence(
    'sg_menu',
    'swig_sg',
    'html_sg',
    'scss_sg',
    'js_sg',
    cb
  );
});


// Start server
gulp.task('server', function(cb) {
  browserSync({
    server: {
      baseDir: paths.dest
    }
  });

  cb();
});


// Watch
gulp.task('watch', ['server'], function(cb) {
  gulp.watch(paths.watch, ['default']);

  cb();
});
