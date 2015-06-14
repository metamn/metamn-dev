---
title: Page not found
---

{% extends '../../project/templates/default/default.html.swig' %}
{% block content %}

  <article class="not-found">
    <h3 class="not-found__title">Page not found</h3>

    <aside class="not-found__animation">
      <h3>Animation</h3>
      {% include 'metamn/metamn.html.swig' %}
    </aside>
  </article>


{% endblock %}
