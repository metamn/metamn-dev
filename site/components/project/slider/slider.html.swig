<article class="slider">
  <h3>Slider</h3>

  <aside class="slides">
    <h3>Slides</h3>

    {% for slide in slides %}
      {% set slide = slide %}
      {% include '__slide/slider__slide.html.swig' %}
    {% endfor %}
  </aside>
</article>
