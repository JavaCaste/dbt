{% macro fullq_name(column1, column2) %}

  lower({{column1}}) + lower({{column2}})

{% endmacro %}