# The name of this view in Looker is "Mbb Teams"
view: mbb_teams {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bytecodeio-datablocks.ncaa_basketball.mbb_teams`
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
  # This dimension will be called "Alias" in Explore.

  dimension: alias {
    type: string
    sql: ${TABLE}.alias ;;
  }

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

  dimension: conf_alias {
    type: string
    sql: ${TABLE}.conf_alias ;;
  }

  dimension: conf_id {
    type: string
    sql: ${TABLE}.conf_id ;;
  }

  dimension: conf_name {
    type: string
    sql: ${TABLE}.conf_name ;;
  }

  dimension: division_alias {
    type: string
    sql: ${TABLE}.division_alias ;;
  }

  dimension: division_id {
    type: string
    sql: ${TABLE}.division_id ;;
  }

  dimension: division_name {
    type: string
    sql: ${TABLE}.division_name ;;
  }

  dimension: kaggle_team_id {
    type: number
    sql: ${TABLE}.kaggle_team_id ;;
  }

  dimension: league_alias {
    type: string
    sql: ${TABLE}.league_alias ;;
  }

  dimension: league_id {
    type: string
    sql: ${TABLE}.league_id ;;
  }

  dimension: league_name {
    type: string
    sql: ${TABLE}.league_name ;;
  }

  dimension: logo_large {
    type: string
    sql: ${TABLE}.logo_large ;;
  }

  dimension: logo_medium {
    type: string
    sql: ${TABLE}.logo_medium ;;
  }

  dimension: logo_small {
    type: string
    sql: ${TABLE}.logo_small ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: school_ncaa {
    type: string
    sql: ${TABLE}.school_ncaa ;;
  }

  dimension: turner_name {
    type: string
    sql: ${TABLE}.turner_name ;;
  }

  dimension: venue_address {
    type: string
    sql: ${TABLE}.venue_address ;;
  }

  dimension: venue_capacity {
    type: number
    sql: ${TABLE}.venue_capacity ;;
  }

  dimension: venue_city {
    type: string
    sql: ${TABLE}.venue_city ;;
  }

  dimension: venue_country {
    type: string
    sql: ${TABLE}.venue_country ;;
  }

  dimension: venue_id {
    type: string
    sql: ${TABLE}.venue_id ;;
  }

  dimension: venue_name {
    type: string
    sql: ${TABLE}.venue_name ;;
  }

  dimension: venue_state {
    type: string
    sql: ${TABLE}.venue_state ;;
  }

  dimension: venue_zip {
    type: string
    sql: ${TABLE}.venue_zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      venue_name,
      conf_name,
      league_name,
      name,
      turner_name,
      division_name
    ]
  }
}
