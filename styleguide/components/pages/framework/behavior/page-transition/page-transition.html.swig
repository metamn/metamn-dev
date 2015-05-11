---
title: Page transition
---

{% extends '../../../../project/templates/default/default.html.swig' %}
{% block content %}

  <aside class="aside">
    <h3 class="aside__title">Page transition</h3>

    <div class="box">
      <p>
      <a class="link" href="{{ site.url }}framework/behavior/page-transition" title="page transition demo">
        Page transition demo.
      </a>
      <p>

      <p>
      Clicking this link will reload this page. The page transition duration is set to 4 seconds to better observe how elements are
      entering the page / scaling up.
      </p>
    </div>
  </aside>

{% endblock %}
