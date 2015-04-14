<section class="work-item">
  <h3>{{ title }}</h3>

  {% set page_title= { title: title, subtitle: work.subtitle } %}
  {% include '../title/title.html.swig' %}

  {% include '__description-with-images/work__description-with-images.html.swig' %}
  {% include '__services-and-menu/work__services-and-menu.html.swig' %}
</section>
