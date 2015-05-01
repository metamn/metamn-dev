---
title: Link
---

{% extends '../../../../../../project/templates/default/default.html.swig' %}
{% block content %}

  <aside class="example__aside">
    <h3 class="aside__title">Link</h3>
    <div class="box">
      <div class="example-1">
        <a class="link" href="#" title="This is a link">This is a link.</a>
      </div>

      <div class="example-2">
        <a class="link" href="#" title="This is an underlined link">This is an underlined link.</a>
      </div>

      <div class="example-3">
        <a class="link" href="#" title="This is a link with line-through">This is a link with line-through.</a>
      </div>
    </div>
  </aside>

{% endblock %}
