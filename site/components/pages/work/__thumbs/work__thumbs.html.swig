<section class="work__thumbs">
  <h3>Thumbs</h3>

  {% for work in site.works %}
    {% include '../../../project/thumb/thumb.html.swig' %}
  {% endfor %}
</section>
