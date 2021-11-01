# The name of this view in Looker is "Team Colors"
view: team_colors {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bytecodeio-datablocks.ncaa_basketball.team_colors`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code Ncaa" in Explore.

  dimension: code_ncaa {
    type: number
    sql: ${TABLE}.code_ncaa ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_code_ncaa {
    type: sum
    sql: ${code_ncaa} ;;
  }

  measure: average_code_ncaa {
    type: average
    sql: ${code_ncaa} ;;
  }

  dimension: color {
    type: string
    sql: ${TABLE}.color ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
