---
title: Figure on figure
---

{% extends '../../../../project/templates/default/default.html.swig' %}
{% block content %}

  <aside class="aside">
    <h3 class="aside__title">Figure on figure</h3>

    <div class="box">
      {% for image in images %}
        {% set image = image %}
        {% set image.site_url = site.site_url %}
        {% include '../../../../../../site/components/framework/structure/figure/figure.html.swig' %}
      {% endfor %}
    </div>
  </aside>

{% endblock %}
