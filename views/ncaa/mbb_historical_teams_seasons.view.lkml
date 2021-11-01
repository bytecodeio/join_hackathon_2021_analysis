# The name of this view in Looker is "Mbb Historical Teams Seasons"
view: mbb_historical_teams_seasons {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bytecodeio-datablocks.ncaa_basketball.mbb_historical_teams_seasons`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Alias" in Explore.

  dimension: alias {
    type: string
    sql: ${TABLE}.alias ;;
  }

  dimension: current_division {
    type: string
    sql: ${TABLE}.current_division ;;
  }

  dimension: division {
    type: number
    sql: ${TABLE}.division ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_division {
    type: sum
    sql: ${division} ;;
  }

  measure: average_division {
    type: average
    sql: ${division} ;;
  }

  dimension: losses {
    type: number
    sql: ${TABLE}.losses ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: season {
    type: number
    sql: ${TABLE}.season ;;
  }

  dimension: team_code {
    type: number
    sql: ${TABLE}.team_code ;;
  }

  dimension: team_id {
    type: string
    sql: ${TABLE}.team_id ;;
  }

  dimension: ties {
    type: number
    sql: ${TABLE}.ties ;;
  }

  dimension: wins {
    type: number
    sql: ${TABLE}.wins ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
