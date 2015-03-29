// Colors
// - generated from components/atoms/colors.scss.json
// - please do not edit directly this file

{% for color in colors %}
// {{ color.description }}
${{ color.name }}: {{ color.value }};
{% endfor %}

// Color combinations. Colors are not used standalone but in pairs
@mixin colors($name) {
{% for pair in color_pairs %}
  @if ($name == '{{ pair.name }}') {
    {% for property in pair.properties %}{{ property.name }}: {{ property.value }};
    {% endfor %}
  }
{% endfor %}
}
