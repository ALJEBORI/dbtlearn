{% macro learn_variables() %}
  {% set your_name_jinja = "Mohammed ALJEBORI" %}
  {{ log("Hello " ~ your_name_jinja, info=True) }}
  {{ log("Hello dbt User  " ~ var("user_name") ~"!", info=True) }}
{% endmacro %}