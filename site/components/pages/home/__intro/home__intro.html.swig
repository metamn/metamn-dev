<section class="home__intro">
  <h3>Intro</h3>

  {% set description = home.about %}
  {% include '../../../project/description/description.html.swig' %}

  {% set value = home.ui %}
  {% include '../../../project/values/ui/ui.html.swig' %}
</section>
