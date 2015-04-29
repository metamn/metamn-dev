---
title: Thumb
---

{% extends '../../../project/templates/default/default.html.swig' %}
{% block content %}

  {% set work = works[0] %}
  {% set work.image.site_url = site.site_url %}
  {% include '../../../../../site/components/project/thumb/thumb.html.swig' %}


{% endblock %}
