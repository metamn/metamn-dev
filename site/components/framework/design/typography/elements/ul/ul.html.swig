<ul class="ul">
  {% for item in items %}
    <li>{% include '../../../decorations/long-dash/long-dash.html.swig' %}{{ item | safe }}</li>
  {% endfor %}
</ul>
