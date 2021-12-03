view: models_source {
  derived_table: {
    sql:
    SELECT
    game_id,
    alias,
    opp_alias,
    gametime,
    assists,
    assists_turnover_ratio,
    defensive_rebounds / NULLIF(defensive_rebounds+opp_offensive_rebounds,0) as def_rebound_pct,
    blocks,
    defensive_rebounds,
    offensive_rebounds,
    points,
    points-opp_points as point_margin,
    COALESCE(fast_break_pts,0) as fast_break_points,
    field_goals_pct,
    free_throws_pct,
    second_chance_pts,
    steals,
    three_points_pct,
    two_points_pct,
    win
    FROM `bytecodeio-datablocks.ncaa_basketball.mbb_teams_games_sr`
    WHERE alias = 'UCLA'
    LIMIT 1000;;
  }

  dimension: game_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.game_id ;;
  }

  dimension: alias {
    type: string
    sql: ${TABLE}.alias ;;
  }

  dimension: opp_alias {
    type: string
    sql: ${TABLE}.opp_alias ;;
  }

  dimension_group: gametime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.gametime ;;
  }

  dimension: assists {
    type: number
    sql: ${TABLE}.assists ;;
  }

  dimension: blocks {
    type: number
    sql: ${TABLE}.blocks ;;
  }

  dimension: assists_turnover_ratio {
    type: number
    sql: ${TABLE}.assists_turnover_ratio ;;
  }

  dimension: def_rebound_pct {
    type: number
    sql: ${TABLE}.def_rebound_pct ;;
  }

  dimension: defensive_rebounds {
    type: number
    sql: ${TABLE}.defensive_rebounds ;;
  }

  dimension: offensive_rebounds {
    type: number
    sql: ${TABLE}.offensive_rebounds ;;
  }

  dimension: points {
    type: number
    sql: ${TABLE}.points ;;
  }

  dimension: point_margin {
    type: number
    sql: ${TABLE}.point_margin ;;
  }

  dimension: fast_break_points {
    type: number
    sql: ${TABLE}.fast_break_points ;;
  }

  dimension: field_goals_pct {
    type: number
    sql: ${TABLE}.field_goals_pct ;;
  }

  dimension: free_throws_pct {
    type: number
    sql: ${TABLE}.free_throws_pct ;;
  }

  dimension: second_chance_pts {
    type: number
    sql: ${TABLE}.second_chance_pts ;;
  }

  dimension: steals {
    type: number
    sql: ${TABLE}.steals ;;
  }

  dimension: three_points_pct {
    type: number
    sql: ${TABLE}.three_points_pct ;;
  }

  dimension: two_points_pct {
    type: number
    sql: ${TABLE}.two_points_pct ;;
  }

  dimension: win {
    type: string
    sql: ${TABLE}.win ;;
  }


}

view: field_selection {
  derived_table: {
    explore_source: models_source{
      column: assists {}
    }
  }

  parameter: input_variables {
    type: string
    default_value: "assists,field_goals_pct,two_points_pct,three_points_pct"
  }
}
