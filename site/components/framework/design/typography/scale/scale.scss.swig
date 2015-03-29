// Typographic grid and scale
// - this file is generated please do not edit


// The default metric for sizing non-typographic elements
// - it is based on the default font size and line height
// - $lem is used for spacing elements on the webpage like margins and padding
{% for scale in scale %}{% if scale.name == 'default' %}{% for property in scale.properties %}{% if property.name == 'font-size' %}{% set font_size = property.value | replace('%', '') %}{%- endif %}{% if property.name == 'line-height' %}{% set line_height = property.value %}{%- endif %}{%- endfor %}
{% set lem = font_size * line_height / 100 %}
$lem: {{ lem }}em;
{% for responsive in scale.responsive %}
@include {{ responsive.breakpoint }} { {% for property in responsive.properties %}{% if property.name == 'font-size' %}{% set font_size = property.value | replace('%', '') %}{%- endif %}{% if property.name == 'line-height' %}{% set line_height = property.value %}{%- endif %}{% endfor %}{% set lem = font_size * line_height / 100 %}
  $lem: {{ lem }}em;
}
{% endfor %}{%- endif %}{%- endfor %}



// Different typographic scales
@mixin scale($variant) {
{% for scale in scale %}
  // {{ scale.description }}
  @if ($variant == '{{ scale.name }}') {
    {% for property in scale.properties %}{{ property.name }}: {{ property.value }};
    {% endfor %}
    {% for responsive in scale.responsive %}
    @include {{ responsive.breakpoint }} {
      {% for property in responsive.properties %}{{ property.name }}: {{ property.value }};
      {% endfor %}
    }
    {% endfor %}
  }
{% endfor %}
}
