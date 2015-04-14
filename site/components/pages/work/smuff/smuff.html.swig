---
title: Smuff
klass: work-single
---

{% extends '../../../project/templates/default/default.html.swig' %}
{% block content %}

  {% set work = smuff %}
  {% include '../../../project/work/work.html.swig' %}

{% endblock %}
