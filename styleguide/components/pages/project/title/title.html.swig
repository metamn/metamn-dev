---
title: Title
---

{% extends '../../../project/templates/default/default.html.swig' %}
{% block content %}

  <aside class="example__aside">
    <h3 class="aside__title">Title without subtitle</h3>

    {% set page_title = { title: "This is a title without subtitle" } %}
    {% include '../../../../../site/components/project/title/title.html.swig' %}
  </aside>

  <aside class="example__aside">
    <h3 class="aside__title">Title with subtitle</h3>

    {% set page_title = { title: "This is a title", subtitle: "with a subtitle" } %}
    {% include '../../../../../site/components/project/title/title.html.swig' %}
  </aside>



{% endblock %}
