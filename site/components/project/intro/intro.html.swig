<article class="intro">
  <h3>Intro</h3>

  {% include '../header/header.html.swig' %}

  <div class="intro__text">
    {% for p in about.paragraphs %}
      <p>{{ p | safe }}</p>
    {% endfor %}
  </div>
</article>
