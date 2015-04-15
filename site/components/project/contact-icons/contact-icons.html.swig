<nav class="contact-icons">
  <h3>Contact icons</h3>

  {% for icon in site.links.contact %}
    {% include '../../framework/design/decorations/icon/icon.html.swig' %}
  {% endfor %}
</nav>
