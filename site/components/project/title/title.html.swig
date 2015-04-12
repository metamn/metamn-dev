<header class="title">
  <span class="title__main">{{ page_title.title | safe }}</span>

  {% if page_title.subtitle && page_title.subtitle != 'Home' %}
    {% include '../../framework/design/decorations/long-dash/long-dash.html.swig' %}
    <span class="title__subtitle">{{ page_title.subtitle | safe }}</span>
  {% endif %}
</header>
