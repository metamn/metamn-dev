<article class="thumb">
  <h3 class="thumb__title">{{ work.title }}</h3>

  <div class="thumb__image">
    {% set image = work.image %}
    {% include '../../framework/structure/figure/figure.html.swig' %}
  </div>
  
  {% include '__services/thumb__services.html.swig' %}
</article>
