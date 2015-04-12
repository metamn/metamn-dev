<section class="work work__services-and-menu">
  <h3>Services and the Menu</h3>

  <aside class="services">
    <h3>Services</h3>

    {% set items = work.services %}
    {% include '../../../framework/design/typography/elements/ul/--no-dash/ul--no-dash.html.swig' %}
  </aside>

  {% include '../../menu/menu.html.swig' %}
</section>
