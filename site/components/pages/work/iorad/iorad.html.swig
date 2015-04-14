---
title: Iorad
klass: work-single
---

{% extends '../../../project/templates/default/default.html.swig' %}
{% block content %}

  {% set work = iorad %}
  {% include '../../../project/work/work.html.swig' %}

{% endblock %}
