var cloneParagraph = function(paragraph) {
  var p = document.querySelector(paragraph);
  var rect = p.getBoundingClientRect();
  var clone = p.cloneNode(true);

  clone.style.top = rect.top + 'px';
  clone.style.left = rect.left + 'px';
  clone.classList.add('cloned');

  var body = document.querySelector('body');
  body.appendChild(clone);

  // If the paragraph is already rotated the 'rect' position values are incorrect
  // - 1. get the parapgraph position
  // - 2. assign to the clone
  // - 3. rotate the paragraph
  p.classList.add('rotated');
}


//cloneParagraph('.styleguide-home .intro__description .bordered');
