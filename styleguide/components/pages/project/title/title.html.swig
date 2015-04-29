---
title: Title
---

{% extends '../../../project/templates/default/default.html.swig' %}
{% block content %}

  {% set page_title = { title: "This is a title without subtitle" } %}
  {% include '../../../../../site/components/project/title/title.html.swig' %}

  {% set page_title = { title: "This is a title", subtitle: "with a subtitle" } %}
  {% include '../../../../../site/components/project/title/title.html.swig' %}


{% endblock %}
