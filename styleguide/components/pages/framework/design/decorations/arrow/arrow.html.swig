---
title: Arrow
---

{% extends '../../../../../project/templates/default/default.html.swig' %}
{% block content %}

  <aside class='active'>
    <h3>Active arrows</h3>
    {% set active = { title: "Test" } %}
    {% set arrow = { item: active, direction: 'left' } %}
    {% include '../../../../../../../site/components/framework/design/decorations/arrow/arrow.html.swig' %}

    {% set arrow = { item: active, direction: 'right' } %}
    {% include '../../../../../../../site/components/framework/design/decorations/arrow/arrow.html.swig' %}
  </aside>

  <aside class="inactive">
    <h3>Inactive arrows</h3>
    {% set arrow = { item: inactive, direction: 'left' } %}
    {% include '../../../../../../../site/components/framework/design/decorations/arrow/arrow.html.swig' %}

    {% set arrow = { item: inactive, direction: 'right' } %}
    {% include '../../../../../../../site/components/framework/design/decorations/arrow/arrow.html.swig' %}
  </aside>

{% endblock %}
