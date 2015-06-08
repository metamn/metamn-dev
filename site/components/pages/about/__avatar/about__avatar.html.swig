<aside class="about__avatar">
  <h3>Avatar</h3>

  {% for image in about.images %}
    {% set image = image %}
    {% include '../../../framework/structure/figure/figure.html.swig' %}
  {% endfor %}
</aside>
