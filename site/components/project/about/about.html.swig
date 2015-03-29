<article class="about">
  <h3>About</h3>

  <div class="about__text">
    {% for p in about.paragraphs %}
      <p>{{ p | safe }}</p>
    {% endfor %}
  </div>
</article>
