---
title: Work
---

{% extends '../../project/templates/default/default.html.swig' %}
{% block content %}

  {% set works = works %}
  {% include '../../project/works/works.html.swig' %}

{% endblock %}
