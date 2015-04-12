---
title: Work
---

{% extends '../../project/templates/default/default.html.swig' %}
{% block content %}

  {% set page_title = { title: title } %}
  {% include '../../project/title/title.html.swig' %}

  {% include '__thumbs/work__thumbs.html.swig' %}

  {% include '../../project/menu/menu.html.swig' %}

{% endblock %}
