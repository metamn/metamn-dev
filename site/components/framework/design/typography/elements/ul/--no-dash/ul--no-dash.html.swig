<ul class="ul ul--no-dash">
  {% for item in items %}
    <li>{{ item | safe }}</li>
  {% endfor %}
</ul>
