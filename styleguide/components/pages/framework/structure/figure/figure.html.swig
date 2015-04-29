---
title: Figure
---

{% extends '../../../../project/templates/default/default.html.swig' %}
{% block content %}


  {% set image = figure.responsive[0] %}

  <figure>
    <img src="{{ site.site_url }}assets/images/{{ image.name }}_mobile.png" title="{{ image.title }}">
    <figcaption>Mobile</figcaption>
  </figure>

  <figure>
    <img src="{{ site.site_url }}assets/images/{{ image.name }}_mobile2x.png" title="{{ image.title }}">
    <figcaption>Mobile with retina display</figcaption>
  </figure>

  <figure>
    <img src="{{ site.site_url }}assets/images/{{ image.name }}_tablet.png" title="{{ image.title }}">
    <figcaption>Tablet</figcaption>
  </figure>

  <figure>
    <img src="{{ site.site_url }}assets/images/{{ image.name }}_tablet2x.png" title="{{ image.title }}">
    <figcaption>Tablet with retina display</figcaption>
  </figure>

  <figure>
    <img src="{{ site.site_url }}assets/images/{{ image.name }}_laptop.png" title="{{ image.title }}">
    <figcaption>Laptop</figcaption>
  </figure>

  <figure>
    <img src="{{ site.site_url }}assets/images/{{ image.name }}_laptop2x.png" title="{{ image.title }}">
    <figcaption>Laptop with retina display</figcaption>
  </figure>

  <figure>
    <img src="{{ site.site_url }}assets/images/{{ image.name }}_desktop.png" title="{{ image.title }}">
    <figcaption>Desktop</figcaption>
  </figure>

  <figure>
    <img src="{{ site.site_url }}assets/images/{{ image.name }}_desktop2x.png" title="{{ image.title }}">
    <figcaption>Desktop with retina display</figcaption>
  </figure>


{% endblock %}
