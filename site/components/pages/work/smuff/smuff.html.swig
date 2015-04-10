---
title: Smuff
klass: work
---

{% extends '../../../project/templates/default/default.html.swig' %}
{% block content %}

  {% set work = smuff %}
  {% include '../../../project/work/work.html.swig' %}

{% endblock %}
