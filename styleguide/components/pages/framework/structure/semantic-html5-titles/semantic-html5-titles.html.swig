---
title: Semantic HTML5 Titles
---

{% extends '../../../../project/templates/default/default.html.swig' %}
{% block content %}

  {% for image in semantic.images %}
    <aside>
      <h3 class="aside__title">{{ image.title }}</h3>
      {% set image.site_url = site.site_url %}
      {% include '../../../../../../site/components/framework/structure/figure/figure.html.swig' %}
    </aside>
  {% endfor %}

{% endblock %}
