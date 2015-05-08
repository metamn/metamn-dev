var pageTransitionOut = function() {
  var click = document.querySelectorAll('a');
  var body = document.querySelector('body');

  for (var i = 0; i < click.length; i++ ) {
    click[i].addEventListener('click', clickLink, false);
  }

  function clickLink() {
    body.classList.add('clicked');
  }
}

pageTransitionOut();
