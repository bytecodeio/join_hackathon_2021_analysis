
view: training_dataset {
  sql_table_name: `bytecodeio-datablocks.ncaa_basketball.mbb_teams_games_sr` ;;

  dimension: game_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.game_id ;;
  }

  dimension: alias {
    group_label: "Main Team"
    type: string
    sql: ${TABLE}.alias ;;
  }

  dimension: assists {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.assists ;;
  }

  dimension: assists_turnover_ratio {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.assists_turnover_ratio ;;
  }

  dimension: blocks {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.blocks ;;
  }

  dimension: defensive_rebounds {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.defensive_rebounds ;;
  }

  dimension: def_rebound_pct {
    type: number
    sql: ${defensive_rebounds} / NULLIF((${defensive_rebounds} + ${opp_offensive_rebounds}),0) ;;
    value_format_name: decimal_2
  }

  dimension: diff_assist_turnover_ratio {
    type: number
    sql: ${assists_turnover_ratio} - ${opp_assists_turnover_ratio} ;;
    value_format_name: decimal_2
  }

  dimension: diff_field_goal_pct {
    type: number
    sql: ${field_goals_pct} - ${opp_field_goals_pct} ;;
    value_format_name: decimal_2
  }

  dimension: diff_three_point_pct {
    type: number
    sql: ${three_points_pct} - ${opp_three_points_pct} ;;
    value_format_name: decimal_2
  }

  dimension: diff_freethrow_pct {
    type: number
    sql: ${free_throws_pct} - ${opp_free_throws_pct} ;;
    value_format_name: decimal_2
  }

  dimension: diff_point {
    type: number
    sql: ${points} - ${opp_points} ;;
  }

  dimension: fast_break_pts {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.fast_break_pts ;;
  }

  dimension: field_goals_att {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.field_goals_att ;;
  }

  dimension: field_goals_made {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.field_goals_made ;;
  }

  dimension: field_goals_pct {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.field_goals_pct ;;
  }

  dimension: free_throws_att {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.free_throws_att ;;
  }

  dimension: free_throws_made {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.free_throws_made ;;
  }

  dimension: free_throws_pct {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.free_throws_pct ;;
  }

  dimension: home_team {
    type: yesno
    sql: ${TABLE}.home_team ;;
  }

  dimension: minutes {
    type: string
    sql: ${TABLE}.minutes ;;
  }

  dimension: name {
    group_label: "Main Team"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: neutral_site {
    type: yesno
    sql: ${TABLE}.neutral_site ;;
  }

  dimension: offensive_rebounds {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.offensive_rebounds ;;
  }

  dimension: off_rebound_pct {
    type: number
    sql: ${offensive_rebounds} / NULLIF((${offensive_rebounds} + ${opp_defensive_rebounds}),0) ;;
    value_format_name: decimal_2
  }

  dimension: opp_alias {
    group_label: "Opponent"
    type: string
    sql: ${TABLE}.opp_alias ;;
  }

  dimension: opp_assists {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_assists ;;
  }

  dimension: opp_assists_turnover_ratio {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_assists_turnover_ratio ;;
  }

  dimension: opp_blocks {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_blocks ;;
  }

  dimension: opp_defensive_rebounds {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_defensive_rebounds ;;
  }

  dimension: opp_fast_break_pts {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_fast_break_pts ;;
  }

  dimension: opp_field_goals_att {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_field_goals_att ;;
  }

  dimension: opp_field_goals_made {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_field_goals_made ;;
  }

  dimension: opp_field_goals_pct {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_field_goals_pct ;;
  }

  dimension: opp_free_throws_att {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_free_throws_att ;;
  }

  dimension: opp_free_throws_made {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_free_throws_made ;;
  }

  dimension: opp_free_throws_pct {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_free_throws_pct ;;
  }

  dimension: opp_id {
    group_label: "Opponent"
    type: string
    sql: ${TABLE}.opp_id ;;
  }

  dimension: opp_minutes {
    group_label: "Opponent"
    type: string
    sql: ${TABLE}.opp_minutes ;;
  }

  dimension: opp_name {
    group_label: "Opponent"
    type: string
    sql: ${TABLE}.opp_name ;;
  }

  dimension: opp_offensive_rebounds {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_offensive_rebounds ;;
  }

  dimension: opp_points {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_points ;;
  }

  dimension: opp_points_game {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_points_game ;;
  }

  dimension: opp_points_off_turnovers {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_points_off_turnovers ;;
  }

  dimension: opp_rebounds {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_rebounds ;;
  }

  dimension: opp_second_chance_pts {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_second_chance_pts ;;
  }

  dimension: opp_steals {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_steals ;;
  }

  dimension: opp_three_points_att {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_three_points_att ;;
  }

  dimension: opp_three_points_made {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_three_points_made ;;
  }

  dimension: opp_three_points_pct {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_three_points_pct ;;
  }

  dimension: opp_three_point_pct_of_made {
    type: number
    sql: ${opp_three_points_made} / NULLIF(${opp_field_goals_made},0) ;;
    value_format_name: decimal_2
  }

  dimension: opp_three_point_pct_of_shots {
    type: number
    sql: ${opp_three_points_att} / NULLIF(${opp_field_goals_att},0) ;;
    value_format_name: decimal_2
  }

  dimension: opp_turnovers {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_turnovers ;;
  }

  dimension: opp_two_points_att {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_two_points_att ;;
  }

  dimension: opp_two_points_made {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_two_points_made ;;
  }

  dimension: opp_two_points_pct {
    group_label: "Opponent"
    type: number
    sql: ${TABLE}.opp_two_points_pct ;;
  }

  dimension: overtime_game {
    type: yesno
    sql: ${minutes} > '3:20:00' ;;
  }

  dimension: points {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.points ;;
  }

  dimension: points_off_turnovers {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.points_off_turnovers ;;
  }

  dimension: rebounds {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.rebounds ;;
  }

  dimension_group: scheduled {
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
    sql: ${TABLE}.scheduled_date ;;
  }

  dimension: season {
    type: number
    sql: ${TABLE}.season ;;
  }

  dimension: second_chance_pts {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.second_chance_pts ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: steals {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.steals ;;
  }

  dimension: team_id {
    group_label: "Main Team"
    type: string
    sql: ${TABLE}.team_id ;;
  }

  dimension: three_points_att {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.three_points_att ;;
  }

  dimension: three_points_made {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.three_points_made ;;
  }

  dimension: three_points_pct {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.three_points_pct ;;
  }

  dimension: three_point_pct_of_made {
    type: number
    sql: ${three_points_made} / NULLIF(${field_goals_made},0) ;;
    value_format_name: decimal_2
  }

  dimension: three_point_pct_of_shots {
    type: number
    sql: ${three_points_att} / NULLIF(${field_goals_att},0) ;;
    value_format_name: decimal_2
  }

  dimension: total_points {
    type: number
    sql: ${points} + ${opp_points} ;;
  }

  dimension: tournament {
    type: string
    sql: ${TABLE}.tournament ;;
  }

  dimension: turnovers {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.turnovers ;;
  }

  dimension: two_points_att {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.two_points_att ;;
  }

  dimension: two_points_made {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.two_points_made ;;
  }

  dimension: two_points_pct {
    group_label: "Main Team"
    type: number
    sql: ${TABLE}.two_points_pct ;;
  }

  dimension: win {
    type: yesno
    sql: ${TABLE}.win ;;
  }

  dimension: win_number {
    hidden: yes
    type: number
    sql: CASE WHEN ${TABLE}.win is True THEN 1 ELSE 0 END ;;
  }

  ###### Measures ######

  measure: number_of_games {
    type: count_distinct
    sql: ${game_id} ;;
  }

  measure: number_of_wins {
    type: sum
    sql: ${win_number} ;;
  }

}
