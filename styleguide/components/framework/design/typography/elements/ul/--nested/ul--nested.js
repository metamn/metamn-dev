var ulNested = function(toggler) {
  var triggers = document.querySelectorAll(toggler);

  function onViewChange(event) {
    this.classList.toggle('active');
    event.stopPropagation();
  }

  for (var i = 0; i < triggers.length; i++ ) {
    triggers[i].addEventListener('click', onViewChange, false);
  }
}
