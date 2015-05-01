---
title: Description
---

{% extends '../../../project/templates/default/default.html.swig' %}
{% block content %}

  <aside class="example__aside">
    <h3 class="aside__title">Description</h3>
    {% include '../../../../../site/components/project/description/description.html.swig' %}
  </aside>

{% endblock %}
