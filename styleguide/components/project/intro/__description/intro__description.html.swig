<aside class="intro__description">
  <h3>Description</h3>

  <p>
    This is the styleguide accompannying the site
    {% set url = site.url | replace('styleguide/', '') %}
    {% set link = { url: url, title: site.site_title + '.', type: "external" } %}
    {% include '../../../../../site/components/framework/design/typography/elements/link/link.html.swig' %}
    It serves as a visual documentation for the framework and components building the site.
  </p>

  <p class="bordered">
    Any changes made to the site design is automatically reflected in this styleguide.
  </p>

  <p>
    We use the
    {% set link = { url: 'https://en.bem.info/method/filesystem/', title: 'BEM methodology', type: "external" } %}
    {% include '../../../../../site/components/framework/design/typography/elements/link/link.html.swig' %}
    to name and structure code. BEM is using <strong>Framework</strong> for basic components like typography, colors, the grid and
    <strong>Project</strong> for all other components specific to the site like headers, thumbs, portfolio sections.
  </p>
</aside>
