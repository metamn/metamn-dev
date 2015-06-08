<aside class="about__contact">
  <h3>Services</h3>

  <ul>
    {% for link in about.links %}
      <li>
        <span class="glyph">{{ link.glyph }}</span>
        {% include '../../../framework/design/decorations/long-dash/long-dash.html.swig' %}
        {% include '../../../framework/design/typography/elements/link/link.html.swig' %}
      </li>
    {% endfor %}
  </ul>
</aside>
