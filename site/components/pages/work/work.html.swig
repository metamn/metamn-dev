---
title: Work
---

{% extends '../../project/templates/default/default.html.swig' %}
{% block content %}

  {% for work in works %}
    {% include '../../project/thumb/thumb.html.swig' %}
  {% endfor %}

  {% include '../../project/menu/menu.html.swig' %}

{% endblock %}
