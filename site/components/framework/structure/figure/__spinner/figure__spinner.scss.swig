// Spinner from http://spiffygif.com/
@mixin figure__spinner($spinner-type) {
  background: url("{{ site.url }}assets/images/spinner#{$spinner-type}.gif") no-repeat center center;
  min-width: 68px;
  min-height: 68px;

  @include mobile {
    background: url("{{ site.url }}assets/images/spinner#{$spinner-type}-small.gif") no-repeat center center;
    min-width: 30px;
    min-height: 30px;
  }

  // Hide image alt text
  img {
    color: transparent;
  }
}
