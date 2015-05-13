var transitionExample = function(examples) {
  var items = document.querySelectorAll(examples);

  for (var i = 0; i < items.length; i++ ) {
    items[i].addEventListener('click', click, false);
  }

  function click(event) {
    var transform = this.style.transform;
    if (transform) {
      var minus = transform.indexOf('50');
      if (minus !== -1) {
        _transform(this, '0px');
      } else {
        _transform(this, '50px');
      }
    } else {
      _transform(this, '50px');
    }
  }

  function _transform(item, value) {
    item.style.webkitTransform = 'translate(' + value + ', 0)' + 'translateZ(0)';

    item.style.MozTransform =
    item.style.msTransform =
    item.style.OTransform =
    item.style.transform = 'translateX(' + value + ')';
  }
}

transitionExample('.styleguide-transition .example div');
