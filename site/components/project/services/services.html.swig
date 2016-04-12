<section class="services">
  <h3>Services</h3>

  {% for service in services %}
    {% include '../service/service.html.swig' %}
  {% endfor %}
</section>
