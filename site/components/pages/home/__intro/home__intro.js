var introAnimation = function(slidesID) {
  var slides = document.querySelectorAll(slidesID);
  if (!slides) return;

  for (var i = 0; i < slides.length; i++) {
    introAnimationDisplayYear(slides[i]);
  }
}


function introAnimationDisplayYear(slide) {
  var year = slide.dataset.year;
  if (!year) return;

  var position = slide.getBoundingClientRect();
  // the width and height of a letter is removed
  var w = position.width - 28.4333;
  var h = position.height - 42.0833;

  var d = document.createElement('div');
  d.className = 'slide__background';

  var s1 = document.createElement('span');
  s1.innerHTML = year[0];
  s1.className = 'letter letter--1';
  s1.style.top = '0px';
  s1.style.left = '0px';
  d.appendChild(s1);

  var s2 = document.createElement('span');
  s2.innerHTML = year[1];
  s2.className = 'letter letter--2';
  s2.style.top = '0px';
  s2.style.left = w + 'px';
  d.appendChild(s2);

  var s3 = document.createElement('span');
  s3.innerHTML = year[2];
  s3.className = 'letter letter--3';
  s3.style.top = h + 'px';
  s3.style.left = '0px';
  d.appendChild(s3);

  var s4 = document.createElement('span');
  s4.innerHTML = year[3];
  s4.className = 'letter letter--4';
  s4.style.top = h + 'px';
  s4.style.left = w + 'px';
  d.appendChild(s4);

  slide.appendChild(d);
}


introAnimation('.home__intro .slider .slides .slide');
