{% include '../head/head.html.swig' %}

{% set link = { url: site.url, title: site.title, type: "external" } %}
{% include '../../header/header.html.swig' %}

{% block content %}{% endblock %}

{% include '../../menu/menu.html.swig' %}
{% include '../scripts/scripts.html.swig' %}
