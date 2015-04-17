<article class="background-slider">
  <h3>Background Slider</h3>

  {% for image in images %}
    {% include '../../structure/figure/figure.html.swig' %}
  {% endfor %}
</article>
