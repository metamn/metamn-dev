<article class="work__description-with-images">
  <h3>Work description with images</h3>

  {% set description = work.description %}
  {% include '../../description/description.html.swig' %}

  {% set slides = work.slides %}
  {% include '../../slider/slider.html.swig' %}
</article>
