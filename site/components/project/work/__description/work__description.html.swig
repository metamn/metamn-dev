<article class="work work__description">
  <h3>Description</h3>

  <div class="text">
    {% for p in work.description %}
      <p>{{ p | safe }}</p>
    {% endfor %}
  </div>

  <nav class="navigation">
    <h3>Navigation</h3>
    <span onclick="prev()">&lsaquo;</span>
    <span onclick="next()">&rsaquo;</span>
  </nav>
</article>
