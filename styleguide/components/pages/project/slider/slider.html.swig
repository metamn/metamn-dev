---
title: Slider
---

{% extends '../../../project/templates/default/default.html.swig' %}
{% block content %}

  <aside class="aside">
    <h3 class="aside__title">Slider</h3>

    {% set site_url = site.site_url %}
    {% include '../../../../../site/components/project/slider/slider.html.swig' %}

    {% set bullets = slides %}
    {% include '../../../../../site/components/project/slider/__bullets/slider__bullets.html.swig' %}
  </aside>

{% endblock %}
