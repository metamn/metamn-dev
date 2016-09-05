{% include '../head/head.html.swig' %}

<div class="flexbox-ie-container">
  {% include '../../styleguide-header/styleguide-header.html.swig' %}

  {% set page_title = { title: site.title, subtitle: title } %}
  {% include '../../../../../site/components/project/title/title.html.swig' %}


  <section class="description-and-example">
    <h3>{{ title }}</h3>

    {% include '../../styleguide-description/styleguide-description.html.swig' %}

    <article class="example">
      <h3 class="example__title">Example</h3>

      {% block content %}{% endblock %}
    </article>
  </section>

  {% include '../../styleguide-menu/styleguide-menu.html.swig' %}

  {% include '../../../../../site/components/project/menu/menu.html.swig' %}
</div>

{% include '../scripts/scripts.html.swig' %}
