{% import "../../../helpers/link/link.swig" as l  %}

<div class="icon">
  {% if icon.url %}{{ l.link(icon) }}{% endif %}
  <span class="icon-{{ icon.icon }}"></span>
{% if icon.url %}</a>{% endif %}
</div>
