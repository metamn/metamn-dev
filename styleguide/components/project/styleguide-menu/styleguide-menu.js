var menuActive = function(menuItems) {
  var htmlClassList = document.querySelector('html').classList;
  var items = document.querySelectorAll(menuItems);

  for (var i = 0; i < items.length; i++ ) {
    var itemTitle = items[i].children[0].children[0].getAttribute('title').replace(/\s+/g, '-').toLowerCase();

    if (htmlClassList.contains('styleguide-' + itemTitle)) {
      items[i].classList.add('inactive');
      makeParentsActive(items[i]);
    }
  }

  function makeParentsActive(element) {
    while (element) {
      if (element.classList.contains('folder')) {
        element.classList.add('active');
      }
      element = element.parentNode;
    }
  }
}



ulNested('.styleguide-menu__framework li');
ulNested('.styleguide-menu__project li');

menuActive('.styleguide-menu__framework li.file');
menuActive('.styleguide-menu__project li.file');
