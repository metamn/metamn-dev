<article class="text-style__styles">
  <h3>Styles</h3>

  {% for text in text_styles %}
    {% set classname = c.classname(text.name) %}
    <aside>
      <h3>{{ text.name }}</h3>

      <div class="{{ classname }}">
        {% if classname == 'default' %}
          This is the default text. With a high contrast background and a modern typeface with extra letter spacing
          it should look electric, vibrant, energizing on all displays.
        {% endif %}

        {% if classname == 'logo' %}
          Metamn is techy
        {% endif %}

        {% if classname == 'body-text' %}
          <p>
            The body text&mdash;used for long text blocks with more than one paragraphs like the work description or the about section&mdash;is
            set to be highly readable.
          </p>

          <p>
            Every line displays around 35-40 characters only and paragraphs are separated with an empty line.
          </p>
        {% endif %}

        {% if classname == 'title' %}
          A page or section title. Bold.
        {% endif %}

        {% if classname == 'menu' %}
          Menu is differentiated yet non-intrusive.
        {% endif %}
      </div>
    </aside>
  {% endfor %}
</article>
