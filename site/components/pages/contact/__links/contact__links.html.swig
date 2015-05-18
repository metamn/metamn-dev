<article class="contact__links">
  <h3>Contact links</h3>

  <dl>
    {% for link in contact.links %}
      <dt>{% include '../../../framework/design/typography/elements/link/link.html.swig' %}</dt>
      <dd>
        {{ link.description }}
      </dd>
    {% endfor %}
  </dl>
</article>
