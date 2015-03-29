<nav class="links">
  <h3>Links</h3>

  <ul class="ul">
    {% for link in site.links.main %}
      {% set link = link %}
      <li>
        {% include '../../framework/design/decorations/long-dash/long-dash.html.swig' %}
        {% include '../../framework/design/typography/elements/link/link.html.swig' %}
      </li>
    {% endfor %}
  </ul>

  <ul class="ul">
    {% for article in site.articles %}
      {% set link = { title: article } %}
      <li>
        {% include '../../framework/design/decorations/long-dash/long-dash.html.swig' %}
        {% include '../../framework/design/typography/elements/link/link.html.swig' %}
      </li>
    {% endfor %}
  </ul>


  <ul class="ul">
    {% for link in site.links.contact %}
      {% set link = link %}
      <li>
        {% include '../../framework/design/decorations/long-dash/long-dash.html.swig' %}
        {% include '../../framework/design/typography/elements/link/link.html.swig' %}
      </li>
    {% endfor %}
  </ul>

</nav>
