<article class="contact__icons">
  <h3>Contact icons</h3>

  {% for link in contact.links %}
    <div class="icon">
      <span class="glyph">{{ link.glyph }}</span>

      {% include '../../../framework/design/decorations/long-dash/long-dash.html.swig' %}
      {% include '../../../framework/design/typography/elements/link/link.html.swig' %}
    </div>
  {% endfor %}
</article>
