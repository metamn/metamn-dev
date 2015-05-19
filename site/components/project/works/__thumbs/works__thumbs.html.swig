<section class="works__thumbs">
  <h3>Works thumbs</h3>

  {% for work in site.works %}
    {% include '../../thumb/thumb.html.swig' %}
  {% endfor %}
</section>
