---
title: Contact
---

{% extends '../../project/templates/default/default.html.swig' %}
{% block content %}

  {% set page_title = { title: title } %}
  {% include '../../project/title/title.html.swig' %}

  <dl class="contact__links">
    {% for link in contact.links %}
      <dt>{% include '../../framework/design/typography/elements/link/link.html.swig' %}</dt>
      <dd>
        {{ link.description }}
      </dd>
    {% endfor %}
  </dl>
{% endblock %}
