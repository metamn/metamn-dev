---
title: Figure
---

{% extends '../../../../project/templates/default/default.html.swig' %}
{% block content %}


  {% set image = figure.responsive[0] %}

  <aside>
    <h3>Mobile</h3>
    <div class="box">
      <figure>
        <img src="{{ site.site_url }}assets/images/{{ image.name }}_mobile.png" title="{{ image.title }}">
        <figcaption>Mobile</figcaption
      </figure>
    </div>
  </aside>

  <aside>
    <h3>Mobile for retina displays</h3>
    <div class="box">
      <figure>
        <img src="{{ site.site_url }}assets/images/{{ image.name }}_mobile2x.png" title="{{ image.title }}">
        <figcaption>Mobile for retina displays</figcaption>
      </figure>
    </div>
  </aside>

  <aside>
    <h3>Tablet</h3>
    <div class="box">
      <figure>
        <img src="{{ site.site_url }}assets/images/{{ image.name }}_tablet.png" title="{{ image.title }}">
        <figcaption>Tablet</figcaption>
      </figure>
    </div>
  </aside>

  <aside>
    <h3>Tablet for retina displays</h3>
    <div class="box">
      <figure>
        <img src="{{ site.site_url }}assets/images/{{ image.name }}_tablet2x.png" title="{{ image.title }}">
        <figcaption>Tablet for retina displays</figcaption>
      </figure>
    </div>
  </aside>

  <aside>
    <h3>Laptop</h3>
    <div class="box">
      <figure>
        <img src="{{ site.site_url }}assets/images/{{ image.name }}_laptop.png" title="{{ image.title }}">
        <figcaption>Laptop</figcaption>
      </figure>
    </div>
  </aside>

  <aside>
    <h3>Laptop for retina displays</h3>
    <div class="box">
      <figure>
        <img src="{{ site.site_url }}assets/images/{{ image.name }}_laptop2x.png" title="{{ image.title }}">
        <figcaption>Laptop for retina displays</figcaption>
      </figure>
    </div>
  </aside>

  <aside>
    <h3>Desktop</h3>
    <div class="box">
      <figure>
        <img src="{{ site.site_url }}assets/images/{{ image.name }}_desktop.png" title="{{ image.title }}">
        <figcaption>Desktop</figcaption>
      </figure>
    </div>
  </aside>

  <aside>
    <h3>Desktop for retina displays</h3>
    <div class="box">
      <figure>
        <img src="{{ site.site_url }}assets/images/{{ image.name }}_desktop2x.png" title="{{ image.title }}">
        <figcaption>Desktop for retina displays</figcaption>
      </figure>
    </div>
  </aside>

{% endblock %}
