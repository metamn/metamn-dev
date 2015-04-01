<article class="thumb">
  <h3 class="thumb__title">
    {% set link = { url: work.url, title: work.title } %}
    {% include '../../framework/design/typography/elements/link/link.html.swig' %}
  </h3>

  <div class="thumb__categories">
    {{ work.services | join(', ') }}
  </div>
</article>
