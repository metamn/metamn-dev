---
title: Long dash
---

{% extends '../../../../../project/templates/default/default.html.swig' %}
{% block content %}

  <aside class="aside">
    <h3 class="aside__title">Long dash</h3>
    <div class="box example-1">
      This<span class="long-dash"></span>text<span class="long-dash"></span>is<span class="long-dash"></span>using<span class="long-dash"></span>the<span class="long-dash"></span>long<span class="long-dash"></span>dash.
    </div>
  </aside>

  <aside class="aside">
    <h3 class="aside__title">Normal dash</h3>
    <div class="box example-2">
      This&mdash;text&mdash;is&mdash;using&mdash;the&mdash;regular&mdash;dash.
    </div>
  </aside>

{% endblock %}
