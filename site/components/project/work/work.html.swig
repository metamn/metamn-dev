<section class="work">
  <h3>{{ title }}</h3>

  {% include '__services/work__services.html.swig' %}

  <div class="work__container">
    {% include '__description/work__description.html.swig' %}
    {% include '__images/work__images.html.swig' %}
  </div>
</section>
