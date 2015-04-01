<article class="work work__description">
  <h3>Description</h3>

  <div class="text">
    {% for p in work.description %}
      <p>{{ p | safe }}</p>
    {% endfor %}
  </div>
</article>
