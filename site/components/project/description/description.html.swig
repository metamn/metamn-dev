<article class="description">
  <h3>Description</h3>

  <div class="description__text">
    {% for p in description.paragraphs %}
      <p>{{ p | safe }}</p>
    {% endfor %}
  </div>
</article>
