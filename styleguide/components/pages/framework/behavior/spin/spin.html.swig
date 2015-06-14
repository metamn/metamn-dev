---
title: Spin
---

{% extends '../../../../project/templates/default/default.html.swig' %}
{% block content %}

  <aside class="aside">
    <h3 class="aside__title">Spin</h3>

    <article class="not-found">
      <h3 class="not-found__title">Page not found</h3>

      <aside class="not-found__animation">
        <h3>Animation</h3>
        {% include '../../../../../../site/components/pages/not-found/metamn/metamn.html.swig' %}
      </aside>
    </article>

  </aside>

{% endblock %}
