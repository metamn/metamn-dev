<header class="work__title">
  <h3 class="title">
    {{ title | safe }}
    {% include '../../../framework/design/decorations/long-dash/long-dash.html.swig' %}
    {{ work.subtitle | safe }}
  </h3>
</header>
