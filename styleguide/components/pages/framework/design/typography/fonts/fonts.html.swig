---
title: Fonts
---

{% import "../../../../../../../site/components/framework/helpers/classname/classname.swig" as c  %}
{% extends '../../../../../project/templates/default/default.html.swig' %}
{% block content %}

{% for font in fonts %}
  <article>
    <h3 class="article__title">{{ font.name }}</h3>
    <ul>
      <li>{{ font.description }}, {{ font.family }}</li>

    </ul>

    {% set font_name = c.classname(font.name) %}
    {% for style in font.styles %}
      {% set style_name = c.classname(style.name ) %}
      <aside class="{{ font_name }}-{{ style_name }}">
        <div class="text">
          <h3 class="aside__title">{{ font.name }}, {{ style.name }}</h3>
          <p>
            Hello, I'm a designer and developer creating user interfaces and experiences for the web.
          </p>
        </div>
      </aside>
    {% endfor %}
  </article>
{% endfor %}

{% endblock %}
