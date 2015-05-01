---
title: Color overlay
---

{% extends '../../../../../project/templates/default/default.html.swig' %}
{% block content %}

  <aside class='overlay'>
    <h3>Images with color overlay</h3>

    <div class="box">
      {% for image in overlay.images %}
        {% set image.site_url = site.site_url %}
        {% include '../../../../../../../site/components/framework/structure/figure/figure.html.swig' %}
      {% endfor %}
    </div>
  </aside>

  <aside class="no-overlay">
    <h3>Images without color overlay</h3>

    <div class="box">
      {% for image in overlay.images %}
        {% set image.site_url = site.site_url %}
        {% include '../../../../../../../site/components/framework/structure/figure/figure.html.swig' %}
      {% endfor %}
    </div>
  </aside>

{% endblock %}
