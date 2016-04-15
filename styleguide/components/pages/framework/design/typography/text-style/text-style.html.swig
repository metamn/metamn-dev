---
title: Text Style
---

{% import "../../../../../../../site/components/framework/helpers/classname/classname.swig" as c  %}
{% extends '../../../../../project/templates/default/default.html.swig' %}
{% block content %}

  {% for text in text_styles %}
    {% set classname = c.classname(text.name) %}
    <aside class="aside">
      <h3 class="aside__title">{{ text.name }}</h3>

      <div class="box text-style--{{ classname }}">
        {% if classname == 'default' %}
          This is the default text. With a high contrast background and a modern typeface with extra letter spacing
          it should look electric, vibrant, energizing on all displays.
        {% endif %}

        {% if classname == 'logo' %}
          Metamn is techy
        {% endif %}

        {% if classname == 'body-text' %}
          <p>
            The body text used for long text blocks with more than one paragraphs like the work description or the about section.
            Set to be highly readable.
          </p>

          <p>
            Every line displays 35-40 characters and consecutive paragraphs are separated with an empty line.
          </p>
        {% endif %}

        {% if classname == 'title' %}
          A page or section title. Bold.
        {% endif %}

        {% if classname == 'headline' %}
          This is a large headline text.
        {% endif %}
      </div>
    </aside>
  {% endfor %}

{% endblock %}
