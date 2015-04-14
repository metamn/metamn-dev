<article class="thumb">

  <aside class="thumb__image">
    <h3>{{ work.title }} thumb</h3>

    <div class="container">
      {% set image = work.image %}
      {% include '../../framework/structure/figure/figure.html.swig' %}
    </div>
  </aside>


  <h3 class="thumb__title">
    {% set link = { url: work.url, title: work.title } %}
    {% include '../../framework/design/typography/elements/link/link.html.swig' %}
  </h3>
</article>
