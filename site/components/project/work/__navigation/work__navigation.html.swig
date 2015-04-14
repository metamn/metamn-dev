<nav class="work__navigation">
  <h3>Navigation</h3>

  {% for item in site.works %}
    {% if item.title == title %}
      {% set prev_index = loop.index - 1 %}
      {% set next_index = loop.index + 1 %}
    {% endif %}
  {% endfor %}

  {% for item in site.works %}
    {% if loop.index == prev_index %}
      {% set prev = item %}
    {% endif %}

    {% if loop.index == next_index %}
      {% set next = item %}
    {% endif %}
  {% endfor %}


  {% set arrow = { item: prev, direction: 'left' } %}
  {% include '../../../framework/design/decorations/arrow/arrow.html.swig' %}

  {% set arrow = { item: next, direction: 'right' } %}
  {% include '../../../framework/design/decorations/arrow/arrow.html.swig' %}
</nav>
