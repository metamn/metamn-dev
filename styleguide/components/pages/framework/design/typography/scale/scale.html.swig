---
title: Scale
---

{% extends '../../../../../project/templates/default/default.html.swig' %}
{% block content %}

{% for scale in scale %}
  <aside>
    <h3>{{ scale.name | capitalize }}</h3>
    <dl class="{{ scale.name }}">
      <dt>{{ scale.description }}</dt>
      {% for property in scale.properties %}
        <dd>{{ property.name }}: {{ property.value }}</dd>
      {% endfor %}
    </dl>
  </aside>
{% endfor %}

{% endblock %}
