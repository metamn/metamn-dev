<nav class="menu">
  <h3>Menu</h3>

  {% for link in site.links.menu %}
    <div class="menu__item">
      {% set link = { title: link.title } %}
      {% include '../../framework/design/typography/elements/link/link.html.swig' %}
    </div>
  {% endfor %}
</nav>
