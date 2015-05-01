---
title: Thumb
---

{% extends '../../../project/templates/default/default.html.swig' %}
{% block content %}

  <aside class="example__aside">
    <h3 class="aside__title">Thumb</h3>

    {% set work = works[0] %}
    {% set work.image.site_url = site.site_url %}
    {% include '../../../../../site/components/project/thumb/thumb.html.swig' %}
  </aside>
{% endblock %}
