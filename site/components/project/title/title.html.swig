<header class="title">
  <span class="title__main">{{ title.main | safe }}</span>

  {% if title.subtitle %}
    {% include '../../framework/design/decorations/long-dash/long-dash.html.swig' %}
    <span class="title__subtitle">{{ title.subtitle | safe }}</span>
  {% endif %}
</header>
