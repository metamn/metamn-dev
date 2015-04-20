<article class="thumb">

  <aside class="thumb__image">
    <h3>{{ work.title }} thumb</h3>

    <div class="container">
      {% set image = work.image %}
      {% include '../../framework/structure/figure/figure.html.swig' %}
    </div>
  </aside>
</article>
