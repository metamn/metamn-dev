---
title: Home
---

{% extends '../../project/templates/default/default.html.swig' %}
{% block content %}

  {% set about = home.about %}
  {% include '../../project/about/about.html.swig' %}

{% endblock %}
