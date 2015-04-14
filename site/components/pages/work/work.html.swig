---
title: Work
klass: work-archive
---

{% extends '../../project/templates/default/default.html.swig' %}
{% block content %}

  {% set page_title = { title: title } %}
  {% include '../../project/title/title.html.swig' %}

  {% include '__thumbs/work__thumbs.html.swig' %}
{% endblock %}
