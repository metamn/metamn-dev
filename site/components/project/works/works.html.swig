<section class="works">
  <h3>Works</h3>

  {% for work in works %}
    <article class="work">
      <div class="work__services">
        {{ work.services | join(', ') }}
      </div>

      <h3 class="work__title">
        {% set link = { title: work.title } %}
        {% include '../../framework/design/typography/elements/link/link.html.swig' %}
      </h3>
    </article>
  {% endfor %}
</section>
