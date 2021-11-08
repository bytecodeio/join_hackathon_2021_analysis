# The name of this view in Looker is "Mbb Historical Teams Games"
view: mbb_historical_teams_games {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bytecodeio-datablocks.ncaa_basketball.mbb_historical_teams_games`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Alias" in Explore.
dimension: prim_key {
  primary_key: yes
  description: "There is duplicate data in this table, created closes primary key"
  type: string
  sql: ${team_id} || ${opp_id} || ${opp_points_game} || ${points_game} || ${scheduled_date} || ${season} ;;
}
  dimension: alias {
    type: string
    sql: ${TABLE}.alias ;;
  }

  dimension: attendance {
    type: number
    sql: ${TABLE}.attendance ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_attendance {
    type: sum
    sql: ${attendance} ;;
  }

  measure: average_attendance {
    type: average
    sql: ${attendance} ;;
  }

  dimension: current_division {
    type: string
    sql: ${TABLE}.current_division ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: opp_alias {
    type: string
    sql: ${TABLE}.opp_alias ;;
  }

  dimension: opp_code {
    type: number
    sql: ${TABLE}.opp_code ;;
  }

  dimension: opp_current_division {
    type: string
    sql: ${TABLE}.opp_current_division ;;
  }

  dimension: opp_id {
    type: string
    sql: ${TABLE}.opp_id ;;
  }

  dimension: opp_market {
    type: string
    sql: ${TABLE}.opp_market ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}.opp_name ;;
  }

  dimension: opp_points_game {
    type: number
    sql: ${TABLE}.opp_points_game ;;
  }

  dimension: points_game {
    type: number
    sql: ${TABLE}.points_game ;;
  }

  dimension: scheduled_date {
    type: string
    sql: ${TABLE}.scheduled_date ;;
  }

  dimension: season {
    type: number
    sql: ${TABLE}.season ;;
  }

  dimension: team_code {
    type: string
    sql: ${TABLE}.team_code ;;
  }

  dimension: team_id {
    type: string
    sql: ${TABLE}.team_id ;;
  }

  dimension: win {
    type: yesno
    sql: ${TABLE}.win ;;
  }

  measure: count {
    type: count
    drill_fields: [opp_name, name]
  }
}
