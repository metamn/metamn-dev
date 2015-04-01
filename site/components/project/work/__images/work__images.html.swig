<article class="work work__images">
  <h3>Images</h3>

  <aside class="slides">
    <h3>Slides</h3>

    {% for slide in work.slides %}
      {% set slide = slide %}
      <div class="slide">
        {% for image in slide.images %}
          {% set image = image %}
          {% include '../../../framework/structure/figure/figure.html.swig' %}
        {% endfor %}
      </div>
    {% endfor %}
  </aside>

  <nav class="navigation">
    <h3>Navigation</h3>
    <button onclick="prev()">&rsaquo;</button>
    <button onclick="next()">&raquo;</button>
  </nav>
</article>
