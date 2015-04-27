---
title: Colors
---

{% extends '../../../../project/templates/default/default.html.swig' %}
{% block content %}

  <aside class="example__colors">
    <h3>Colors</h3>

    {% for color in colors %}
      <div>
        <span class="{{ color.name }} placeholder"></span>
        <span class="name">{{ color.name }}</span>
      </div>
    {% endfor %}
  </aside>

  <aside class="example__color-pairs">
    <h3>Color pairs</h3>

    {% for color in color_pairs %}
      <div>
        <span class="{{ color.name }} placeholder">
          Colors don't exist alone yet in pairs, like black on white. All color pairs have a contrast ratio set for perfect readability.
        </span>
        <span class="name">{{ color.name }}</span>
      </div>
    {% endfor %}
  </aside>
{% endblock %}
