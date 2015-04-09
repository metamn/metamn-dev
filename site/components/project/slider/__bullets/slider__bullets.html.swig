<nav class="slider__bullets">
  <h3>Navigation bullets</h3>

  {% for bullet in bullets %}
    <div {% if loop.first %}class="active"{% endif %}>
      <span>O</span>
      <span class="active">&bull;</span>
    </div>
  {% endfor %}
</nav>
