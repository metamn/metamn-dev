{% import "../../../helpers/classname/classname.swig" as c  %}

// Typefaces and Fonts
// - this file is auto generated. Please do not edit

{% for font in fonts %}
// {{ font.name }}
// - {{ font.description }}, {{ font.family }}
// - character set: {{ font.character_set }}
// - served from {{ font.served_from }}
// - styles and weights: {% for style in font.styles %}{{ style.name }}, {% endfor %}
{% if font.served_from == "Google" %}
@import url(http://fonts.googleapis.com/css?family={{ font.google_font_id }}:{% for style in font.styles %}{{ style.id }},{% endfor %});
{% endif %}
{% endfor %}


// The font mixin
@mixin font($variant) {
{% for font in fonts %}{% set font_name = c.classname(font.name) %}{% for style in font.styles %}{% set style_name = c.classname(style.name ) %}
  @if ($variant == '{{ font_name }}-{{ style_name }}') {
    font-family: '{{ font_name }}', {{ font.family }};
    font-weight: {{ style.weight }};
    font-style: {{ style.style }};
  }
  {% endfor %}{% endfor %}
}
