---
title: Header
---

{% extends '../../../project/templates/default/default.html.swig' %}
{% block content %}

  <aside class="example__aside">
    <h3 class="aside__title">Header</h3>

    {% set link = { url: site.site_url, title: site.site_title, type: "external" } %}
    {% include '../../../../../site/components/project/header/header.html.swig' %}
  </aside>

{% endblock %}
