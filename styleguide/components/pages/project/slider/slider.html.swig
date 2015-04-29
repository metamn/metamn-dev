---
title: Slider
---

{% extends '../../../project/templates/default/default.html.swig' %}
{% block content %}

  {% include '../../../../../site/components/project/slider/slider.html.swig' %}

  {% set bullets = slides %}
  {% include '../../../../../site/components/project/slider/__bullets/slider__bullets.html.swig' %}

{% endblock %}
