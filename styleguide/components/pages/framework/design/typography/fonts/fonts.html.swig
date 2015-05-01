---
title: Fonts
---

{% import "../../../../../../../site/components/framework/helpers/classname/classname.swig" as c  %}
{% extends '../../../../../project/templates/default/default.html.swig' %}
{% block content %}

  {% for font in fonts %}
    {% set font_name = c.classname(font.name) %}
    {% for style in font.styles %}
      {% set style_name = c.classname(style.name ) %}
      <aside class="example__aside">
        <h3 class="aside__title">{{ font.name }}, {{ style.name }}</h3>
        <div class="box {{ font_name }}-{{ style_name }}">
          Hello, I'm a designer and developer creating user interfaces and experiences for the web.
        </div>
      </aside>
    {% endfor %}
  {% endfor %}

{% endblock %}
