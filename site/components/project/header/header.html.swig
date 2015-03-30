<header class="header">
  <h3 class="header__site-title">
    {% set link = { url: site.url, title: site.title, type: "external" } %}
    {% include '../../framework/design/typography/elements/link/link.html.swig' %}
  </h3>

  {% if title != "Home" %}
    <div class="header__separator">
      {% include '../../framework/design/decorations/long-dash/long-dash.html.swig' %}
    </div>

    <div class="header__page-title">
      {{ title }}
    </div>
  {% endif %}
</header>
