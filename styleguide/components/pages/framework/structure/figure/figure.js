var getImageSize = function(selector) {
  var images = document.querySelectorAll(selector);

  for (var i = 0; i < images.length; i++ ) {
    var size = ' (' + images[i].children[0].width + 'x' + images[i].children[0].height + ')';
    images[i].children[1].innerHTML += size;
  }

}

getImageSize('.styleguide-figure figure');
