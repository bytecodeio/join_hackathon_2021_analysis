# The name of this view in Looker is "Mbb Historical Tournament Games"
view: mbb_historical_tournament_games {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bytecodeio-datablocks.ncaa_basketball.mbb_historical_tournament_games`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Academic Year" in Explore.
dimension: prim_key {
  type: string
  primary_key: yes
  sql: ${game_date} || ${win_team_id} || ${lose_team_id} ;;
}
  dimension: academic_year {
    type: number
    sql: ${TABLE}.academic_year ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_academic_year {
    type: sum
    sql: ${academic_year} ;;
  }

  measure: average_academic_year {
    type: average
    sql: ${academic_year} ;;
  }

  dimension: day {
    type: string
    sql: ${TABLE}.day ;;
  }

  dimension: days_from_epoch {
    type: number
    sql: ${TABLE}.days_from_epoch ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: game {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.game_date ;;
  }

  dimension: lose_alias {
    type: string
    sql: ${TABLE}.lose_alias ;;
  }

  dimension: lose_code_ncaa {
    type: number
    sql: ${TABLE}.lose_code_ncaa ;;
  }

  dimension: lose_kaggle_team_id {
    type: number
    sql: ${TABLE}.lose_kaggle_team_id ;;
  }

  dimension: lose_market {
    type: string
    sql: ${TABLE}.lose_market ;;
  }

  dimension: lose_name {
    type: string
    sql: ${TABLE}.lose_name ;;
  }

  dimension: lose_pts {
    type: number
    sql: ${TABLE}.lose_pts ;;
  }

  dimension: lose_region {
    type: string
    sql: ${TABLE}.lose_region ;;
  }

  dimension: lose_school_ncaa {
    type: string
    sql: ${TABLE}.lose_school_ncaa ;;
  }

  dimension: lose_seed {
    type: string
    sql: ${TABLE}.lose_seed ;;
  }

  dimension: lose_team_id {
    type: string
    sql: ${TABLE}.lose_team_id ;;
  }

  dimension: num_ot {
    type: number
    sql: ${TABLE}.num_ot ;;
  }

  dimension: round {
    type: number
    sql: ${TABLE}.round ;;
  }

  dimension: season {
    type: number
    sql: ${TABLE}.season ;;
  }

  dimension: win_alias {
    type: string
    sql: ${TABLE}.win_alias ;;
  }

  dimension: win_code_ncaa {
    type: number
    sql: ${TABLE}.win_code_ncaa ;;
  }

  dimension: win_kaggle_team_id {
    type: number
    sql: ${TABLE}.win_kaggle_team_id ;;
  }

  dimension: win_market {
    type: string
    sql: ${TABLE}.win_market ;;
  }

  dimension: win_name {
    type: string
    sql: ${TABLE}.win_name ;;
  }

  dimension: win_pts {
    type: number
    sql: ${TABLE}.win_pts ;;
  }

  dimension: win_region {
    type: string
    sql: ${TABLE}.win_region ;;
  }

  dimension: win_school_ncaa {
    type: string
    sql: ${TABLE}.win_school_ncaa ;;
  }

  dimension: win_seed {
    type: string
    sql: ${TABLE}.win_seed ;;
  }

  dimension: win_team_id {
    type: string
    sql: ${TABLE}.win_team_id ;;
  }

  measure: count {
    type: count
    drill_fields: [lose_name, win_name]
  }
}
