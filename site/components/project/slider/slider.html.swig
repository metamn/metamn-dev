<article class="slider">
  <h3>Slider</h3>

  <aside class="slides">
    <h3>Slides</h3>

    {% for slide in slides %}
      {% set slide = slide %}
      <div class="slide">
        {% for image in slide.images %}
          {% set image = image %}
          {% if site_url %}{% set image.site_url = site_url %}{% endif %}
          {% include '../../framework/structure/figure/figure.html.swig' %}
        {% endfor %}
      </div>
    {% endfor %}
  </aside>
</article>
