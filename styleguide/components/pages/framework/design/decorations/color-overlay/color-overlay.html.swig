---
title: Color overlay
---

{% extends '../../../../../project/templates/default/default.html.swig' %}
{% block content %}

  <aside class='aside overlay'>
    <h3 class="aside__title">Images with color overlay</h3>

    <div class="box">
      {% for image in overlay.images %}
        {% set image.site_url = site.site_url %}
        {% include '../../../../../../../site/components/framework/structure/figure/figure.html.swig' %}
      {% endfor %}
    </div>
  </aside>

  <aside class="aside no-overlay">
    <h3 class="aside__title">Images without color overlay</h3>

    <div class="box">
      {% for image in overlay.images %}
        {% set image.site_url = site.site_url %}
        {% include '../../../../../../../site/components/framework/structure/figure/figure.html.swig' %}
      {% endfor %}
    </div>
  </aside>

{% endblock %}
