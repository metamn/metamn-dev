<article class="service">
  <h3 class="service__title">
    {% include '../../framework/design/decorations/long-dash/long-dash.html.swig' %}
    {{ service.title }}
  </h3>

  {% set items = service.items %}
  {% include '__items/service__items.html.swig' %}
</article>
