---
title: Color overlay
---

{% extends '../../../../../project/templates/default/default.html.swig' %}
{% block content %}

  <aside class='overlay'>
    <h3>Images with color overlay</h3>

    {% for image in images %}
      {% include '../../../../../../../site/components/framework/structure/figure/figure.html' %}
    {% endfor %}
  </aside>

  <aside class="no-overlay">
    <h3>Images without color overlay</h3>

    {% for image in images %}
      {% include '../../../../../../../site/components/framework/structure/figure/figure.html' %}
    {% endfor %}
  </aside>

{% endblock %}
