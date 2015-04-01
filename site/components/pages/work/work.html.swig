---
title: Work
---

{% extends '../../project/templates/default/default.html.swig' %}
{% block content %}

  <section class="work__archive">
    <h3>Work archive</h3>

    {% for work in works %}
      {% include '../../project/thumb/thumb.html.swig' %}
    {% endfor %}
  </section>

{% endblock %}
