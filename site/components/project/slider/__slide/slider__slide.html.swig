<div class="slide" {% if slide.year %} data-year="{{ slide.year }}" {% endif %}>
  {% for image in slide.images %}
    {% set image = image %}
    {% if site_url %}{% set image.site_url = site_url %}{% endif %}
    {% include '../../../framework/structure/figure/figure.html.swig' %}
  {% endfor %}
</div>
