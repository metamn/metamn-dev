var menu = function(menuItems) {
  var htmlClassList = document.querySelector('html').classList;
  var items = document.querySelectorAll(menuItems);

  for (var i = 0; i < items.length; i++ ) {
    var itemTitle = items[i].children[0].getAttribute('title').toLowerCase();

    console.log('t:' + itemTitle);

    if (htmlClassList.contains(itemTitle)) {
      items[i].classList.add('inactive');
    }
  }
}

menu('.menu .menu__item');
