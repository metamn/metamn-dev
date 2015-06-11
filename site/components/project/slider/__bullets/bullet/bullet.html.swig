{% set klass = '' %}

{% if loop.first %}
  {% set klass="active" %}
{% endif %}

<div class="bullet {{ klass }}">
  <span class="inactive">O</span>
  <span class="active">&bull;</span>
</div>
