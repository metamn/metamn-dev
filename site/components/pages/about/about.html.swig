---
title: About
---

{% extends '../../project/templates/default/default.html.swig' %}
{% block content %}

  {% set page_title = { title: title } %}
  {% include '../../project/title/title.html.swig' %}

  {% set description = about %}
  {% include '../../project/description/description.html.swig' %}

  {% include '__services/about__services.html.swig' %}

{% endblock %}
