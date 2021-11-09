# If necessary, uncomment the line below to include explore_source.
# include: "hackathon_2021_ncaa.model.lkml"

view: training_dataset_dt {
  derived_table: {
    explore_source: training_dataset {
      column: team_id {}
      column: name {}
      column: scheduled_date {}
      column: season {}
      column: points {}
      column: opp_points {}
      column: off_rebound_pct {}
      column: def_rebound_pct {}
      column: three_point_pct_of_made {}
      column: three_point_pct_of_shots {}
      column: field_goals_pct {}
      column: free_throws_pct {}
      column: three_points_pct {}
      column: two_points_pct {}
      column: turnovers {}
      column: steals {}
      column: points_off_turnovers {}
      column: offensive_rebounds {}
      column: defensive_rebounds {}
      column: blocks {}
      column: assists {}
      column: assists_turnover_ratio {}
      column: fast_break_pts {}
      column: second_chance_pts {}
      column: opp_assists {}
      column: opp_assists_turnover_ratio {}
      column: opp_blocks {}
      column: opp_defensive_rebounds {}
      column: opp_fast_break_pts {}
      column: opp_field_goals_pct {}
      column: opp_free_throws_pct {}
      column: opp_offensive_rebounds {}
      column: opp_points_off_turnovers {}
      column: opp_second_chance_pts {}
      column: opp_steals {}
      column: opp_three_points_pct {}
      column: opp_turnovers {}
      column: opp_two_points_pct {}
      column: diff_assist_turnover_ratio {}
      column: diff_field_goal_pct {}
      column: diff_freethrow_pct {}
      column: diff_three_point_pct {}
      column: diff_point {}
      column: home_team {}
      column: neutral_site {}
      column: overtime_game {}
      column: win {}
      column: number_of_games {}
      derived_column: season_points_running_total {
        sql: SUM(points) OVER (PARTITION BY season, team_id
                               ORDER BY scheduled_date
                               ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW);;
      }
      derived_column: season_games_running_total {
        sql: COUNT(number_of_games) OVER (PARTITION BY season, team_id
                                          ORDER BY scheduled_date
                                          ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW);;
      }
      filters: {
        field: training_dataset.season
        value: "not 2017"
      }
      filters: {
        field: training_dataset.tournament
        value: "NULL"
      }
    }
  }
  dimension: team_id {}
  dimension: name {}
  dimension: scheduled_date {
    type: date
  }
  dimension: season {
    type: string
  }
  dimension: points {
    type: number
  }
  dimension: opp_points {
    type: number
  }
  dimension: off_rebound_pct {
    value_format: "#,##0.00"
    type: number
  }
  dimension: def_rebound_pct {
    value_format: "#,##0.00"
    type: number
  }
  dimension: three_point_pct_of_made {
    value_format: "#,##0.00"
    type: number
  }
  dimension: three_point_pct_of_shots {
    value_format: "#,##0.00"
    type: number
  }
  dimension: field_goals_pct {
    type: number
  }
  dimension: free_throws_pct {
    type: number
  }
  dimension: three_points_pct {
    type: number
  }
  dimension: two_points_pct {
    type: number
  }
  dimension: turnovers {
    type: number
  }
  dimension: steals {
    type: number
  }
  dimension: points_off_turnovers {
    type: number
  }
  dimension: offensive_rebounds {
    type: number
  }
  dimension: defensive_rebounds {
    type: number
  }
  dimension: blocks {
    type: number
  }
  dimension: assists {
    type: number
  }
  dimension: assists_turnover_ratio {
    type: number
  }
  dimension: fast_break_pts {
    type: number
  }
  dimension: second_chance_pts {
    type: number
  }
  dimension: opp_assists {
    type: number
  }
  dimension: opp_assists_turnover_ratio {
    type: number
  }
  dimension: opp_blocks {
    type: number
  }
  dimension: opp_defensive_rebounds {
    type: number
  }
  dimension: opp_fast_break_pts {
    type: number
  }
  dimension: opp_field_goals_pct {
    type: number
  }
  dimension: opp_free_throws_pct {
    type: number
  }
  dimension: opp_offensive_rebounds {
    type: number
  }
  dimension: opp_points_off_turnovers {
    type: number
  }
  dimension: opp_second_chance_pts {
    type: number
  }
  dimension: opp_steals {
    type: number
  }
  dimension: opp_three_points_pct {
    type: number
  }
  dimension: opp_turnovers {
    type: number
  }
  dimension: opp_two_points_pct {
    type: number
  }
  dimension: diff_assist_turnover_ratio {
    value_format: "#,##0.00"
    type: number
  }
  dimension: diff_field_goal_pct {
    value_format: "#,##0.00"
    type: number
  }
  dimension: diff_freethrow_pct {
    value_format: "#,##0.00"
    type: number
  }
  dimension: diff_three_point_pct {
    value_format: "#,##0.00"
    type: number
  }
  dimension: diff_point {
    type: number
  }
  dimension: home_team {
    label: "Home Team (Yes / No)"
    type: yesno
  }
  dimension: neutral_site {
    label: "Neutral Site (Yes / No)"
    type: yesno
  }
  dimension: overtime_game {
    label: "Overtime Game (Yes / No)"
    type: yesno
  }
  dimension: win {
    label: "Win (Yes / No)"
    type: yesno
  }
  dimension: season_points_running_total {
    type: number
  }
  dimension: season_games_running_total {
    type: number
  }
  dimension: ppg {
    type: number
    sql: ${season_points_running_total} / ${season_games_running_total} ;;
    value_format_name: decimal_2
  }

}
