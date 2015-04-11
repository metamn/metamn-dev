---
title: Wanderlust
klass: work
---

{% extends '../../../project/templates/default/default.html.swig' %}
{% block content %}

  {% set work = wanderlust %}
  {% include '../../../project/work/work.html.swig' %}

{% endblock %}
