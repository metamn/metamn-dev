<article class="thumb">
  <h3 class="thumb__title">{{ work.title }}</h3>

  {% set image = work.image %}
  {% include '../../framework/structure/figure/figure.html.swig' %}

  {% include '__services/thumb__services.html.swig' %}
</article>
