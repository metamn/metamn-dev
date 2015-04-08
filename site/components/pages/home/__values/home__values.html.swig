<section class="home__values">
  <h3>Values</h3>

  {% for value in home.values %}
    {% set file = '../../../project/values/' + value.id + '/' + value.id + '.html.swig' %}
    {% include file %}
  {% endfor %}
</section>
