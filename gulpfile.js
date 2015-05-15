

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
    inflection = require( 'inflection' ),
    mkdirp = require('mkdirp')
    kss = require('kss'),

    sitemap = require('gulp-sitemap'),
    gulpIgnore = require('gulp-ignore');



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
  styleguide_js_src: ['styleguide/components/pages/**/**/*.js', 'styleguide/components/framework/**/**/*.js', 'styleguide/components/project/**/**/*.js'],

  // .js minimezed file name for styleguide
  styleguide_js_filename: 'styleguide.js',

  // .js file destination for styleguide
  styleguide_js_dest: 'dist/styleguide/assets/scripts',


  // .js files to move
  js_move_src: 'assets/scripts/*.js',

  // .js files to move destination
  js_move_dest: 'dist/assets/scripts',




  // where to resize images
  image_resize_dest: 'site/assets/images/resized',

  // images to resize and optimize
  images_resize_src: 'site/assets/images/*.{png,jpg,gif}',

  // images to move
  images_src: 'site/assets/images/*.{png,jpg,gif}',

  // images destination
  images_dest: 'dist/assets/images',


  // fonts
  fonts_src: 'site/assets/fonts/**/*.*',
  fonts_dest: 'dist/assets/fonts/',


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



// Images

// Get the JSON file associated to an image
var image_json = function(file) {
  splits = file.split('.');
  return splits[0] + '.json';
}

// Resize a single image with ImageMagick
var _image_resize = function(file, size, name) {
  console.log("Resizing " + file + " height to " + size);
  gulp.src(file)
    .pipe(plumber({errorHandler: onError}))
    .pipe(imageResize({
      height : size,
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
      // Get the associated JSON file
      splits = file.path.split('.');
      json_file = splits[0] + '.json';
      if (fs.existsSync(json_file)) {
        json = require(json_file);
        sizes = json.image_sizes;
        for (i in sizes) {
          _image_resize(file.path, sizes[i].height * retina, sizes[i].name + retina_name);
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
  return gulp.src(paths.image_resize_dest + '/*.{png,jpg,.gif}')
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


// Move script files
// - move (third party) scripts to dest
var _js_move = function(src, dest) {
  return gulp.src(src)
    .pipe(plumber({errorHandler: onError}))
    .pipe(gulp.dest(dest));
}

gulp.task('js_move', function() {
  _js_move('site/' + paths.js_move_src, paths.js_move_dest);
});

gulp.task('js_sg_move', function() {
  _js_move('styleguide/' + paths.js_move_src, paths.js_move_dest);
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
    // Do not copy BEM modifiers and elements
    .pipe(gulpIgnore.exclude(function(file) {
      if ((file.path.indexOf('--') !== -1) || (file.path.indexOf('__') !== -1)) {
        //console.log("Skipping " + file.path);
        return true;
      }
    }))
    // SEO friendly urls
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

    // use JSON definitions from /site in /styleguide
    .pipe(data(function(file) {
      if (grabJSON) {
        components = file.path.replace('styleguide/components/pages', 'site/components');
        json = components.split('.')[0] + '.scss.json';
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
        locals: {
          // Load site-wide JSON settings
          site: require(config),
          // Load site-wide KSS file
          kss: require('./styleguide/kss.json')
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






// Fonts
// - move fonts to dest
gulp.task('fonts', function() {
  return gulp.src(paths.fonts_src)
    .pipe(plumber({errorHandler: onError}))
    .pipe(gulp.dest(paths.fonts_dest));
});






// Styleguide tasks

// Maps the folder structure into a JSON file
// - http://stackoverflow.com/questions/11194287/convert-a-directory-structure-in-the-filesystem-to-json-with-node-js
function dirTree(filename) {
  var stats = fs.lstatSync(filename);
  var info = { path: filename, name: path.basename(filename) };

  if (stats.isDirectory()) {
    info.type = 'folder';
    info.children = fs.readdirSync(filename).map(function(child) {
      return dirTree(filename + '/' + child);
    });
  } else {
    info.type = 'file';
  }

  return info;
}


// Transforms a JSON file into nested <ul> menu
// - http://jsfiddle.net/BvDW3/
function makeUL(lst) {
  var html = [];
  html.push('<ul>');

  for (var i = 0; i < lst.length; i++ ) {
    if (lst[i].type == 'folder')
      html.push(makeLI(lst[i]));
  }

  html.push('</ul>');
  return html.join("\n");
}

function makeLI(elem) {
    var html = [];

    // decide if this is a folder or a link
    var klass = 'folder';
    for (var i = 0; i < elem.children.length; i++ ) {
      if (elem.children[i].type == 'file') {
        klass = 'file';
      }
    }


    html.push('<li class="' + klass + ' menu-item-' + elem.name + '">');


    // prepare data
    if (elem.path) {
      title = inflection.humanize(elem.name.replace('--', '').replace('__', '').replace(/-/g, ' '));
      link = elem.path.replace('site/components/', '{{ site.url }}')
      html.push('<div>');
    }

    if (elem.children && (klass == 'folder')) {
      html.push(title + '</div>');
      html.push(makeUL(elem.children));
    } else {
      html.push('<a class="link" title="' + title + '" href="' + link + '"><span data-hover="' + title + '">' + title + '</span></a>');
    }

    html.push('</li>');
    return html.join("\n");
}


// Menu
// - create html menu for styleguide
gulp.task('sg_menu', function() {
  var json = dirTree('site/components/framework');
  var menu = makeUL([json]);
  fs.writeFileSync('styleguide/components/project/styleguide-menu/__framework/styleguide-menu__framework.html.swig', menu);

  json = dirTree('site/components/project');
  menu = makeUL([json]);
  fs.writeFileSync('styleguide/components/project/styleguide-menu/__project/styleguide-menu__project.html.swig', menu);
});



// Folders
// - copy folders from /site under styleguide/pages
gulp.task('sg_folders', function() {
  return gulp.src(['site/components/framework/**/**/*','site/components/project/**/**/*'])
    .pipe(plumber({errorHandler: onError}))
    .pipe(data(function(file) {
      var stats = fs.lstatSync(file.path);
      if (stats.isDirectory()) {
        var dir = file.path.replace('site/components', 'styleguide/components/pages');
        if (!fs.existsSync(dir)) {
          mkdirp(dir, function (err) {
            console.log(file.relative + ' created');
          });
        }
      }
    }));
});


// - remove unused folders from styleguide
gulp.task('sg_folders_remove', function() {
  return gulp.src(['styleguide/components/pages/framework/**/**/*','styleguide/components/pages/project/**/**/*'])
    .pipe(plumber({errorHandler: onError}))
    .pipe(data(function(file) {
      var stats = fs.lstatSync(file.path);
      if (stats.isDirectory()) {
        var dir = file.path.replace('styleguide/components/pages', 'site/components');
        if (!fs.existsSync(dir)) {
          console.log(file.relative + ' should be removed from styleguide');
        }
      }
    }));
})


// KSS
// - loads KSS documentation from /site .scss files and saves into a .json file
// - later this /json file can be processed by swig
gulp.task('sg_kss', function() {
  kss.traverse('./site/components', { mask: '*.scss', markdown: true }, function(err, styleguide) {
    if (err) throw err;

    fs.writeFileSync('styleguide/kss.json', JSON.stringify(styleguide.section()));
    //console.log(styleguide.section());
  });
});




// Sitemap
//

gulp.task('sitemap', function () {
  gulp.src(paths.dest + '/**/*.html')
    .pipe(sitemap({
      siteUrl: 'http://metamn.io'
    }))
    .pipe(gulp.dest(paths.dest));
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
    'js_move',
    //'images',
    'fonts',
    cb
  );
});


// The Styleguide task
gulp.task('sg', function(cb) {
  runSequence(
    'sg_menu',
    'sg_folders',
    'sg_folders_remove',
    'sg_kss',
    'swig_sg',
    'html_sg',
    'scss_sg',
    'js_sg',
    'js_sg_move',
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
