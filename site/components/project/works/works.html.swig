<section class="works">
  <h3>Works</h3>

  {% for work in site.works %}
    {% include '../thumb/thumb.html.swig' %}
  {% endfor %}
</section>
