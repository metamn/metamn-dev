---
title: Figure
---

{% extends '../../../../project/templates/default/default.html.swig' %}
{% block content %}

  {% for image in figure.images %}
    {% set image.site_url = site.site_url %}
    {% include '../../../../../../site/components/framework/structure/figure/figure.html.swig' %}
  {% endfor %}

{% endblock %}
