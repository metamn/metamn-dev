{% include '../head/head.html.swig' %}

{% include '../../header/header.html.swig' %}

{% include '../../description/description.html.swig' %}

<article class="example">
  <h3 class="example__title">Example</h3>

  {% block content %}{% endblock %}
</article>

{% include '../../menu/menu.html.swig' %}

{% include '../scripts/scripts.html.swig' %}
