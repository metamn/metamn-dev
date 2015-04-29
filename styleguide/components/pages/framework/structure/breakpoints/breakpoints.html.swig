---
title: Breakpoints
---

{% extends '../../../../project/templates/default/default.html.swig' %}
{% block content %}

  <dl>
  {% for breakpoint in breakpoints %}
    <dt>{{ breakpoint.name | capitalize }}</dt>
    <dd>{{ breakpoint.description }}</dd>
  {% endfor %}
  </dl>

{% endblock %}
