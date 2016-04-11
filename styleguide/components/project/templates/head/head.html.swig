{% import "../../../../../site/components/framework/helpers/classname/classname.swig" as c  %}
{% set classname = c.classname(title) %}

{% import "../../../../../site/components/framework/helpers/pagetitle/pagetitle.swig" as t  %}
{% set page_title = t.pagetitle(title, site.title) %}

<!doctype html>
<html lang="en" class="styleguide styleguide-{{ classname }} {{ klass }}">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <title>{{ page_title | safe }}</title>

    <script src="//use.typekit.net/wrb3hlx.js"></script>
    <script>try{Typekit.load();}catch(e){}</script>

    {% include '../../../../../site/components/project/templates/head/__icons/head__icons.html.swig' %}


    <link href="{{ site.url }}assets/styles/styleguide.css" media="screen, projection" rel="stylesheet" type="text/css" />

    <!-- Picturefill Responsive Images -->
    <script async src="{{ site.site_url }}assets/scripts/picturefill.min.js"></script>

    <!-- ga.js -->
    <script async src="{{ site.site_url }}assets/scripts/ga.js"></script>
  </head>

  <body>
