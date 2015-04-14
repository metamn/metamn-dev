---
title: Reboot
klass: work-single
---

{% extends '../../../project/templates/default/default.html.swig' %}
{% block content %}

  {% set work = reboot %}
  {% include '../../../project/work/work.html.swig' %}

{% endblock %}
