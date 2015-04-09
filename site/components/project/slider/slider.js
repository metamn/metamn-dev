var slider = function(slide, bullets) {

  // Slides
  var slides = document.querySelectorAll(slide);
  var slideCount = slides.length;
  var pos = 0;

  // - move out of viewport inactive slides
  function setTransform() {
    for (var i = 0; i < slideCount; i++ ) {
      slides[i].style['transform'] = 'translateX(' + ((i + pos) * slides[0].offsetWidth) + 'px)';
    }
  }

  // - initialize slides in a responsive way
  setTransform();
  window.addEventListener('resize', setTransform);





  // Bullets
  var bullets = document.querySelectorAll(bullets);

  // - add click event to bullets
  for (var i = 0; i < bullets.length; i++) {
    bullets[i].addEventListener('click', clickBullet, false);
  }

  // - click on a bullet
  function clickBullet(event) {
    active = this.classList.contains('active');
    if (!active) {
      moveSlide(this);
      removeActiveBulletClass();
      this.classList.add('active');
    }
  }

  // - move slide
  function moveSlide(bullet) {
    current = bulletIndex(bullet);
    if (Math.abs(pos) < current ) {
      previousSlide();
    } else {
      nextSlide();
    }
  }




  // Helpers

  // Return the index of the clicked element
  function bulletIndex(bullet) {
    var siblings = bullet.parentNode.childNodes;
    for (var i = 0; i < siblings.length; i++) {
      if (bullet == siblings[i]) break;
    }
    return i;
  }


  // Clear active state for all bullets
  function removeActiveBulletClass() {
    for (var i = 0; i < bullets.length; i++) {
      bullets[i].classList.remove('active');
    }
  }

  // Get previous slide
  function previousSlide() {
    console.log('pos' + pos);
    pos = Math.max(pos - 1, -(slideCount - 1));
    setTransform();
  }

  // Get next slide
  function nextSlide() {
    pos = Math.min(pos + 1, 0);
    setTransform();
  }
}


slider('.slides .slide', '.slider__bullets div');
