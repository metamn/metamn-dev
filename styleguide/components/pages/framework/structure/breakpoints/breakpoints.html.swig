---
title: Breakpoints
---

{% extends '../../../../project/templates/default/default.html.swig' %}
{% block content %}

  <aside class="example__aside">
    <h3 class="aside__title">Breakpoints</h3>
    <div class="box">
      <dl>
      {% for breakpoint in breakpoints %}
        <dt>{{ breakpoint.name | capitalize }}</dt>
        <dd>{{ breakpoint.description }}</dd>
      {% endfor %}
      </dl>
    </div>
  </aside>

{% endblock %}
