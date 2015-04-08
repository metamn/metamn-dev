<section class="home__intro">
  <h3>Intro</h3>

  {% set about = home.about %}
  {% include '../../../project/intro/intro.html.swig' %}

  {% set value = home.ui %}
  {% include '../../../project/values/ui/ui.html.swig' %}
</section>
