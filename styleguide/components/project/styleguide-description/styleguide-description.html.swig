{% import "../../../../site/components/framework/helpers/classname/classname.swig" as c  %}
{% set classname = c.classname(title) %}

{% for k in kss %}
  {% if k.reference == classname %}
    <article class="styleguide-description">
      <h3>Description</h3>

      <div class="text">
        {{ k.description | safe }}
      </div>
    </article>
  {% endif %}
{% endfor %}
