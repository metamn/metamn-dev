<article class="work work__description">
  <h3>Description</h3>

  <div>
    {% for p in work.description %}
      <p>{{ p | safe }}</p>
    {% endfor %}
  </div>
</article>
