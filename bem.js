#!/usr/bin/env node


var fs = require('fs');
var mkdirp = require('mkdirp');


var htmlExt = '.html.swig';
var scssExt = '.scss';



// Helpers
// -----------------------------------------------------------------------------

// Create a folder
var makeFolder = function(path) {
  mkdirp(path, function (err) {
    if (err) throw err;
    console.log('Dir ok');
  });
}


// Create a file with content
var makeFile = function(file, content) {
  fs.writeFile(file, content, function(err) {
    if (err) {
      console.log("Error creating file: " + file);
    } else {
      console.log("File ok");
    }
  });
}


// Create files with content
// - path is the file to be created without extension
// - klass is the HTML class name
var makeFiles = function(path, klass) {
  makeFile(path + htmlExt, '< class="' + klass + '">');

  // For elements and modifiers we have a classname containing the parent, like 'header header__logo'
  // - in this case the first class name must be removed to name the mixin properly, ie @mixin header__logo {}
  makeFile(path + scssExt, "@mixin " + getLastItem(klass, ' ') + " {}");
}



// Create unique classname(s) according to BEM standards
var makeClass = function(object, item, parent) {
  switch (object) {
    case 'block':
      return item;
      break;
    case 'element':
      return parent + ' ' + parent + '__' + item;
      break;
    case 'modifier':
      return parent + ' ' + parent + '--' + item;
  }
}



// Get the last substring of a string
// - ex: 'components/framework' => framework
// - ex: 'header header__logo' => header__logo
var getLastItem = function(str, separator) {
  splits = str.split(separator);
  return splits[splits.length - 1];
}



// Commands
// -----------------------------------------------------------------------------


// Create a level
// - if parents are not existent the file and the folder structure will be created anyway
var makeLevel = function(path) {
  makeFolder(path);
}



// Create a block
// - if parents are not existent the file and the folder structure will be created anyway
// - ex. test header => test/header/header.html.swig, test/header/header.scss
var makeBlock = function(path, name) {
  // test/header
  new_path = path + '/' + name;
  makeFolder(new_path);

  // test/header/header.*
  new_file = new_path + '/' + name;
  klass = makeClass('block', name, '');
  makeFiles(new_file, klass);
}


// Create an Element
// - it has to have a parent already, ie <path> should exist
var makeElement = function(path, name) {
  // header/__logo
  new_path = path + '/__' + name;
  makeFolder(new_path);

  // header/__logo/header__logo.*
  parent = getLastItem(path, '/');
  new_file = new_path + '/' + parent + '__' + name;
  klass = makeClass('element', name, parent);
  makeFiles(new_file, klass);
}


// Create a Modifier
var makeModifier = function(path, argv) {
  modifier = argv._[2];
  if (!modifier) {
    console.log("Modifier missing");
    return;
  }

  value = argv._[3];
  if (!value) {
    console.log("Modifier value missing");
    return;
  }

  splits = path.split('/');
  element = splits[splits.length - 1];
  block = splits[splits.length - 2];
  filename = block + element + '_' + modifier + '_' + value;
  folder = path + '/_' + modifier;
  file = folder + '/' + filename;

  makeFolder(folder);
  makeFile(file + '.html.swig', '< class="' + filename + '">');
  makeFile(file + '.scss', "@mixin " + filename + " {}");
}






// Command line parser
// -----------------------------------------------------------------------------

var argv = require('yargs')
  .usage('Usage: $0 <object> <path> <name>')
  .command('object', 'The BEM object to be created. It can be [level, block, element, modifier] or [l, b, e, m]')
  .command('path', 'The parent of the BEM object')
  .command('name', 'The name of BEM object to be created inside <path>.')
  .example('$0 level components/framework', '=> "components/framework"')
  .example('$0 block components/framework header', '=> "components/framework/header/header.html.swig"')
  .example('$0 element header logo', '=> "header/__logo/header__logo.html.swig"')
  .example('$0 modifier header/__logo hover', '=> "header/__logo/--hover/header__logo--hover.html.swig"')
  .example('$0 modifier header black', '=> "header/--black/header--black.html.swig"')
  .demand(2)
  .argv;

var object = argv._[0];
var path = argv._[1];
var name = argv._[2];


switch (object) {
  case 'level':
  case 'l':
    makeLevel(path);
    break;
  case 'block':
  case 'b':
    makeBlock(path, name);
    break;
  case 'element':
  case 'e':
    makeElement(path, name);
    break;
  case 'modifier':
  case 'm':
    makeModifier(path, name);
    break;
  default:
    console.log('Wrong arguments: ' + object);
}
