// Breakpoints and responsive mixins
// - generated from components/atoms/grid/breakpoints.scss.json
// - please do not edit directly this file

// Set in px instead of em for the following resons
// - em is set by the font-size, px is not. This way breakpoints stays always the same no matter the base font size
// - typography might be responsive, so they use first breakpoints and not vice versa
// - breakpoints in this project depends on image size which is set in pixels
{% for breakpoint in breakpoints %}
// {{ breakpoint.description }}
$breakpoint-{{ breakpoint.name }}: {{ breakpoint.value }};
{% endfor %}


{% for mixin in responsive_mixins %}
@mixin {{ mixin.name }} {
  @media only screen and {{ mixin.media_query }} {
    @content
  }
}
{% endfor %}
