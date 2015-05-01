---
title: Colors
---

{% extends '../../../../project/templates/default/default.html.swig' %}
{% block content %}

  <article class="example__colors">
    <h3>Colors</h3>

    {% for color in colors %}
      <div class="item">
        <span class="{{ color.name }} placeholder"></span>
        <span class="name">{{ color.name }}</span>
      </div>
    {% endfor %}
  </article>

  <div class="example__color-pairs">
    {% for color in color_pairs %}
      <aside class="example__aside">
        <h3 class="aside__title">{{ color.name }}</h3>
        <div class="box {{ color.name }}">
          Colors don't exist alone yet in pairs, like black on white. All color pairs have a contrast ratio set for perfect readability.
        </div>
      </aside>
    {% endfor %}
  </div>
{% endblock %}
