<header class="header">
  <h3 class="header__site-title">
    {% set link = { url: site.url, title: site.title, type: "external" } %}
    {% include '../../framework/design/typography/elements/link/link.html.swig' %}
  </h3>
</header>
