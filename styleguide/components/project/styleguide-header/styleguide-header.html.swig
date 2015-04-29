<header class="styleguide-header">
  <h3 class="header__site-title">
    {% set url = site.url | replace('styleguide/', '') %}
    {% set link = { url: url, title: site.site_title, type: "external" } %}
    {% include '../../../../site/components/framework/design/typography/elements/link/link.html.swig' %}
  </h3>
</header>
