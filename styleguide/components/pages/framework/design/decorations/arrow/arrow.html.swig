---
title: Arrow
---

{% extends '../../../../../project/templates/default/default.html.swig' %}
{% block content %}

  <aside class='active'>
    <h3>Active arrows</h3>

    <div class="box">
      {% set active = { title: "Test" } %}
      {% set arrow = { item: active, direction: 'left' } %}
      {% include '../../../../../../../site/components/framework/design/decorations/arrow/arrow.html.swig' %}

      {% set arrow = { item: active, direction: 'right' } %}
      {% include '../../../../../../../site/components/framework/design/decorations/arrow/arrow.html.swig' %}
    </div>
  </aside>

  <aside class="inactive">
    <h3>Inactive arrows</h3>

    <div class="box">
      {% set arrow = { item: inactive, direction: 'left' } %}
      {% include '../../../../../../../site/components/framework/design/decorations/arrow/arrow.html.swig' %}

      {% set arrow = { item: inactive, direction: 'right' } %}
      {% include '../../../../../../../site/components/framework/design/decorations/arrow/arrow.html.swig' %}
    </div>
  </aside>

{% endblock %}
