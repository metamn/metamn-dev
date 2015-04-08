<article class="ui">
  <h3 class="ui__title">{{ value.title | safe }}</h3>

  {% set image = value.image %}
  {% include '../../../framework/structure/figure/figure.html.swig' %}
</article>
