<figure {% if image.class %} class="{{ image.class }}" {% endif %}>
  {% if image.url %}
    <a href="{{ site.url}}{{ image.url }}" title="{{ image.title }}">
  {% endif %}


  {% set desktop = image.name + '_desktop.png' %}
  {% set desktop2x = image.name + '_desktop2x.png' %}
  {% set laptop = image.name + '_laptop.png' %}
  {% set laptop2x = image.name + '_laptop2x.png' %}
  {% set tablet = image.name + '_tablet.png' %}
  {% set tablet2x = image.name + '_tablet2x.png' %}
  {% set mobile = image.name + '_mobile.png' %}
  {% set mobile2x = image.name + '_mobile2x.png' %}


  <!-- Showing different images for different devices -->
  {% for responsive in image.responsive %}
    {% if responsive.breakpoint == 'desktop' %}
      {% set desktop = responsive.name + '_desktop.png' %}
      {% set desktop2x = responsive.name + '_desktop2x.png' %}
    {% endif %}
    {% if responsive.breakpoint == 'laptop' %}
      {% set laptop = responsive.name + '_laptop.png' %}
      {% set laptop2x = responsive.name + '_laptop2x.png' %}
    {% endif %}
    {% if responsive.breakpoint == 'tablet' %}
      {% set tablet = responsive.name + '_tablet.png' %}
      {% set tablet2x = responsive.name + '_tablet2x.png' %}
    {% endif %}
    {% if responsive.breakpoint == 'mobile' %}
      {% set mobile = responsive.name + '_mobile.png' %}
      {% set mobile2x = responsive.name + '_mobile2x.png' %}
    {% endif %}
  {% endfor %}



  {% set figcaption = image.title %}
  {% set figcaption_class = 'figcaption--from-title' %}

  {% if image.figcaption %}
    {% set figcaption = image.figcaption %}
    {% set figcaption_class = 'figcaption' %}
  {% endif %}


  <picture>
    <!--[if IE 9]><video style="display: none;"><![endif]-->
    <source media="(min-width: 90em)" srcset="{{ site.url }}assets/images/{{ desktop }}, {{ site.url }}assets/images/{{ desktop2x }} 2x">
    <source media="(min-width: 64em)" srcset="{{ site.url }}assets/images/{{ laptop }}, {{ site.url }}assets/images/{{ laptop2x }} 2x">
    <source media="(min-width: 37.5em)" srcset="{{ site.url }}assets/images/{{ tablet }}, {{ site.url }}assets/images/{{ tablet2x }} 2x">
    <source srcset="{{ site.url }}assets/images/{{ mobile }}, {{ site.url }}assets/images/{{ mobile2x }} 2x">
    <!--[if IE 9]></video><![endif]-->
    <img srcset="{{ site.url }}assets/images/{{ desktop }}" alt="{{ image.title }}">
  </picture>

  <figcaption class="{{ figcaption_class }}">
    {{ figcaption }}
  </figcaption>

  {% if image.url %}</a>{% endif %}
</figure>
