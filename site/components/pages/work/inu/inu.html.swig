---
title: Inu Chivu
klass: work
---

{% extends '../../../project/templates/default/default.html.swig' %}
{% block content %}

  {% set work = inu %}
  {% include '../../../project/work/work.html.swig' %}

{% endblock %}
