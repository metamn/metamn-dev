---
title: Wanderlust
klass: work-single
---

{% extends '../../../project/templates/default/default.html.swig' %}
{% block content %}

  {% set work = wanderlust %}
  {% include '../../../project/work/work.html.swig' %}

{% endblock %}
