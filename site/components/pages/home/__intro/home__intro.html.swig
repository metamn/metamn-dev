<section class="home__intro">
  <h3>Intro</h3>

  {% set description = home.about %}
  {% include '../../../project/description/description.html.swig' %}

  {% set slides = home.slides %}
  {% include '../../../project/slider/slider.html.swig' %}

  {% set bullets = home.slides %}
  {% include '../../../project/slider/__bullets/slider__bullets.html.swig' %}
</section>
