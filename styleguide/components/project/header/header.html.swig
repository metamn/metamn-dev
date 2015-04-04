<header class="header">
  <h3 class="header__site-title">
    {% set url = site.url | replace('styleguide/', '') %}
    {% set link = { url: url, title: site.site_title, type: "external" } %}
    {% include '../../../../site/components/framework/design/typography/elements/link/link.html.swig' %}
  </h3>

  <div class="header__separator">
    {% include '../../../../site/components/framework/design/decorations/long-dash/long-dash.html.swig' %}
  </div>

  <div class="header__styleguide-title">
    {% set link = { url: site.url, title: site.title, type: "external" } %}
    {% include '../../../../site/components/framework/design/typography/elements/link/link.html.swig' %}
  </div>

  {% if title != "Home" %}
    <div class="header__page-title">
      {{ title }}
    </div>
  {% endif %}
</header>
