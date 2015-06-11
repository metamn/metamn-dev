<nav class="slider__bullets">
  <h3>Navigation bullets</h3>

  {% for bullet in bullets %}
    {% include 'bullet/bullet.html.swig' %}
  {% endfor %}
</nav>
