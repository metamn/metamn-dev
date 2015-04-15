---
title: About
---

{% extends '../../project/templates/default/default.html.swig' %}
{% block content %}

  {% set page_title = { title: title } %}
  {% include '../../project/title/title.html.swig' %}

  {% set separator_line = true %}
  {% set description = about %}
  {% include '../../project/description/description.html.swig' %}


  {% include '../../project/contact-icons/contact-icons.html.swig' %}

{% endblock %}
