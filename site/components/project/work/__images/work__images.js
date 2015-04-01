var d = document;
var items = d.querySelectorAll('.slides .slide');
var itemCount = items.length;
var itemWidth = items[0].offsetWidth;
console.log("i:" + itemCount + itemWidth);
var pos = 0;

function setTransform() {
  for (var i = 0; i < itemCount; i++ ) {
    items[i].style['transform'] = 'translateX(' + ((-i + pos) * items[0].offsetWidth) + 'px)';
  }
}

function prev() {
  pos = Math.max(pos - 1, 0);
  setTransform();
}

function next() {
  pos = Math.min(pos + 1, itemCount - 1);
  setTransform();
}

setTransform();
window.addEventListener('resize', setTransform);
