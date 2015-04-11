<article class="work__description-with-images">
  <h3>Work description with images</h3>

  {% set description = work.description %}
  {% set separator_line = true %}
  {% include '../../description/description.html.swig' %}

  {% set slides = work.slides %}
  {% include '../../slider/slider.html.swig' %}

  {% set bullets = work.slides %}
  {% include '../../slider/__bullets/slider__bullets.html.swig' %}
</article>
