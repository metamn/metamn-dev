---
title: Semantic HTML5 Titles
---

{% extends '../../../../project/templates/default/default.html.swig' %}
{% block content %}

  {% for image in semantic.images %}
    <aside class="aside">
      <h3 class="aside__title">
        {% set link = image %}
        {% include '../../../../../../site/components/framework/design/typography/elements/link/link.html.swig' %}
      </h3>
      <div class="box">
        {% set image.site_url = site.site_url %}
        {% include '../../../../../../site/components/framework/structure/figure/figure.html.swig' %}
      </div>
    </aside>
  {% endfor %}

{% endblock %}
