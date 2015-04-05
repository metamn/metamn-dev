---
title: Long dash
---

{% extends '../../../../../project/templates/default/default.html.swig' %}
{% block content %}

  {% for k in kss %}
    {% if k.data.reference == 'long-dash' %}
      {{ k.data.description | safe }}
    {% endif %}
  {% endfor %}

{% endblock %}
