---
title: Animation
---

{% extends '../../../../project/templates/default/default.html.swig' %}
{% block content %}

  {% for k in kss %}
    {% if k.data.reference == 'animation' %}
      {{ k.data.description | safe }}
    {% endif %}
  {% endfor %}

{% endblock %}
