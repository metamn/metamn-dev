var introAnimation = function(slidesID) {
  var slides = document.querySelectorAll(slidesID);
  if (!slides) return;

  for (var i = 0; i < slides.length; i++) {
    introAnimationDisplayYear(slides[i], i + 1);
  }

  introAnimationAddGrid(slides[1], 2);
}


function introAnimationAddGrid(slide, index) {
  var position = slide.getBoundingClientRect();
  var w = position.width;
  var h = position.height;

  var s = document.querySelector('.home__intro--animation-' + index);

  var d = document.createElement('div');
  d.className = 'lines lines--vertical';
  d.style.width = w + 'px';
  d.style.height = h + 'px';
  introAnimationDrawLines(20, d);
  s.appendChild(d);

  var d = document.createElement('div');
  d.className = 'lines lines--horizontal';
  d.style.width = w + 'px';
  d.style.height = h + 'px';
  introAnimationDrawLines(20, d);
  s.appendChild(d);
}



function introAnimationDisplayYear(slide, activeSlideIndex) {
  var position = slide.getBoundingClientRect();

  var year = slide.dataset.year;
  if (!year) return;

  var w = position.width - (position.width / 30);
  var h = position.height - (position.height / 30);

  var d = document.createElement('div');
  d.className = 'home__intro--animation-' + activeSlideIndex;

  var s1 = document.createElement('span');
  s1.innerHTML = year[0];
  s1.className = 'letter letter--1';
  s1.style.top = '0';
  s1.style.left = '0';
  d.appendChild(s1);

  var s2 = document.createElement('span');
  s2.innerHTML = year[1];
  s2.className = 'letter letter--2';
  s2.style.top = '0';
  s2.style.left = w + 'px';
  d.appendChild(s2);

  var s3 = document.createElement('span');
  s3.innerHTML = year[2];
  s3.className = 'letter letter--3';
  s3.style.top = h + 'px';
  s3.style.left = '0';
  d.appendChild(s3);

  var s4 = document.createElement('span');
  s4.innerHTML = year[3];
  s4.className = 'letter letter--4';
  s4.style.top = h + 'px';
  s4.style.left = w + 'px';
  d.appendChild(s4);

  slide.appendChild(d);
}



// Helpers

function introAnimationDrawLines(nr, parent) {
  for (var i = 0; i < nr; i++) {
    var g = document.createElement('span');
    j = i + 1;
    g.className = 'line line--' + j;

    var b = document.createElement('span');
    b.className = 'line__border';

    g.appendChild(b);
    parent.appendChild(g);
  }
}



introAnimation('.home__intro .slider .slides .slide');
