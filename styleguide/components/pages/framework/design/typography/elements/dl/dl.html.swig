---
title: Dl
---

{% extends '../../../../../../project/templates/default/default.html.swig' %}
{% block content %}

  <dl class="contact__links">
    {% for link in contact.links %}
      <dt>{{ link.url }}</dt>
      <dd>
        {{ link.description }}
      </dd>
    {% endfor %}
  </dl>
{% endblock %}
