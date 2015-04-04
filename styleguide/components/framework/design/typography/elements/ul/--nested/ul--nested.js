var ulNested = function(toggler) {
  var triggers = document.querySelectorAll(toggler);
  console.log(triggers);

  function onViewChange(evt) {
    this.parentNode.classList.toggle('active');
  }

  for (var i = 0; i < triggers.length; i++ ) {
    triggers[i].addEventListener('click', onViewChange, false);
  }
}
