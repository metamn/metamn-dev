---
title: Figure
---

{% extends '../../../../project/templates/default/default.html.swig' %}
{% block content %}


  {% set image = figure.responsive[0] %}

  <aside class="aside">
    <h3 class="aside__title">Mobile (338px × 200px)</h3>
    <div class="box">
      <figure>
        <img src="{{ site.site_url }}assets/images/{{ image.name }}_mobile.png" title="{{ image.title }}">
        <figcaption>Mobile (338px × 200px)</figcaption
      </figure>
    </div>
  </aside>

  <aside class="aside">
    <h3 class="aside__title">Mobile for retina displays (676px × 400px)</h3>
    <div class="box">
      <figure>
        <img src="{{ site.site_url }}assets/images/{{ image.name }}_mobile2x.png" title="{{ image.title }}">
        <figcaption>Mobile for retina displays (676px × 400px)</figcaption>
      </figure>
    </div>
  </aside>

  <aside class="aside">
    <h3 class="aside__title">Tablet (591px × 350px)</h3>
    <div class="box">
      <figure>
        <img src="{{ site.site_url }}assets/images/{{ image.name }}_tablet.png" title="{{ image.title }}">
        <figcaption>Tablet (591px × 350px)</figcaption>
      </figure>
    </div>
  </aside>

  <aside class="aside">
    <h3 class="aside__title">Tablet for retina displays (1.183px × 700px)</h3>
    <div class="box">
      <figure>
        <img src="{{ site.site_url }}assets/images/{{ image.name }}_tablet2x.png" title="{{ image.title }}">
        <figcaption>Tablet for retina displays (1.183px × 700px)</figcaption>
      </figure>
    </div>
  </aside>

  <aside class="aside">
    <h3 class="aside__title">Laptop (688px × 407px)</h3>
    <div class="box">
      <figure>
        <img src="{{ site.site_url }}assets/images/{{ image.name }}_laptop.png" title="{{ image.title }}">
        <figcaption>Laptop (688px × 407px)</figcaption>
      </figure>
    </div>
  </aside>

  <aside class="aside">
    <h3 class="aside__title">Laptop for retina displays (1.375px × 814px)</h3>
    <div class="box">
      <figure>
        <img src="{{ site.site_url }}assets/images/{{ image.name }}_laptop2x.png" title="{{ image.title }}">
        <figcaption>Laptop for retina displays (1.375px × 814px)</figcaption>
      </figure>
    </div>
  </aside>

  <aside class="aside">
    <h3 class="aside__title">Desktop (992px × 587px)</h3>
    <div class="box">
      <figure>
        <img src="{{ site.site_url }}assets/images/{{ image.name }}_desktop.png" title="{{ image.title }}">
        <figcaption>Desktop (992px × 587px)</figcaption>
      </figure>
    </div>
  </aside>

  <aside class="aside">
    <h3 class="aside__title">Desktop for retina displays (1.926px × 1.140px)</h3>
    <div class="box">
      <figure>
        <img src="{{ site.site_url }}assets/images/{{ image.name }}_desktop2x.png" title="{{ image.title }}">
        <figcaption>Desktop for retina displays (1.926px × 1.140px)</figcaption>
      </figure>
    </div>
  </aside>

{% endblock %}
