{% if arrow.item.title %}
  <div class="arrow active">
    <a href="{{ site.url }}{{ arrow.item.url }}" title="{{ arrow.item.title }}">
      <span class="arrow__icon">
        {% if arrow.direction == 'left' %}
          &lsaquo;
        {% endif %}

        {% if arrow.direction == 'right' %}
          &rsaquo;
        {% endif %}
      </span>
      <span class="arrow__text">{{ arrow.item.title }}</span>
    </a>
  </div>
{% else %}
  <div class="arrow inactive">
    <span class="arrow__icon">&lsaquo;</span>
  </div>
{% endif %}
