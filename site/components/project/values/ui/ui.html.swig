<article class="ui">
  <h3 class="ui__title">{{ value.title }}</h3>

  {% set image = value.image %}
  {% include '../../../framework/structure/figure/figure.html.swig' %}
</article>
