<aside class="lines">
  <h3>Animated lines</h3>

  {% set lines = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40] %}

  {% for i in lines %}
    {% if loop.index <= line_count %}
      {% include '../line/line.html.swig' %}
    {% endif %}
  {% endfor %}
</aside>
