---
title: Dl
---

{% extends '../../../../../../project/templates/default/default.html.swig' %}
{% block content %}

  <aside>
    <h3>Data list</h3>
    <div class="box">
      <dl class="contact__links">
        {% for link in contact.links %}
          <dt>{{ link.url }}</dt>
          <dd>
            {{ link.description }}
          </dd>
        {% endfor %}
      </dl>
    </div>
  </aside>
{% endblock %}
