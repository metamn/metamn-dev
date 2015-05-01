---
title: Stretch
---

{% extends '../../../../../project/templates/default/default.html.swig' %}
{% block content %}

  <article class="stretch--columns">
    <h3>Stretching columns vertically</h3>

    <aside class="aside">
      <h3 class="aside__title">Item on top</h3>
      <div class="box">
      </div>
    </aside>

    <aside class="aside">
      <h3 class="aside__title">Item on bottom</h3>
      <div class="box">
      </div>
    </aside>
  </article>

{% endblock %}
