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
        this.style['transform'] = 'translateX(0px)';
      } else {
        this.style['transform'] = 'translateX(50px)';
      }
    } else {
      this.style['transform'] = 'translateX(50px)';
    }

  }
}

transitionExample('.styleguide-transition .example div');
