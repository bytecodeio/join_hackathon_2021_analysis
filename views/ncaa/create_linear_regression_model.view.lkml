view: regression_source{
  derived_table: {
    persist_for: "1 hour"
    sql: SELECT
         points - opp_points as point_margin,
         assists_turnover_ratio,
         opp_assists_turnover_ratio,
         field_goals_pct,
         opp_field_goals_pct,
      FROM `bytecodeio-datablocks.ncaa_basketball.mbb_teams_games_sr`
      WHERE home_team = TRUE
      LIMIT 1000
       ;;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: point_margin {
    type: number
    sql: ${TABLE}.point_margin ;;
  }

  dimension: assists_turnover_ratio {
    type: number
    sql: ${TABLE}.assists_turnover_ratio ;;
  }

  dimension: opp_assists_turnover_ratio {
    type: number
    sql: ${TABLE}.opp_assists_turnover_ratio ;;
  }

  dimension: field_goals_pct {
    type: number
    sql: ${TABLE}.field_goals_pct ;;
  }

  dimension: opp_field_goals_pct {
    type: number
    sql: ${TABLE}.opp_field_goals_pct ;;
  }

  set: detail {
    fields: [point_margin, assists_turnover_ratio, opp_assists_turnover_ratio, field_goals_pct, opp_field_goals_pct]
  }
}



view: point_margin_regression {

  derived_table: {
    persist_for: "1 hour"
    sql_create:
             CREATE OR REPLACE MODEL
                  ${SQL_TABLE_NAME}
             OPTIONS (
                  model_type = 'LINEAR_REG',
                  input_label_cols =  ['point_margin']
              ) AS
                  SELECT
                    point_margin,
                    field_goals_pct,
                    opp_field_goals_pct
                  FROM ${regression_source.SQL_TABLE_NAME};;
  }
}

view: point_margin__eval {

  derived_table: {
    persist_for: "1 hour"
    sql:
            SELECT
              *
            FROM ml.EVALUATE(
              MODEL ${point_margin_regression.SQL_TABLE_NAME},
              (SELECT
                 *
               FROM ${regression_source.SQL_TABLE_NAME}));;
  }dimension: mean_absolute_error {type: number}
  dimension: mean_squared_error {type: number}
  dimension: mean_squared_log_error {type: number}
  dimension: median_absolute_error {type: number}
  dimension: r2_score {type: number}
  dimension: explained_variance {type: number}
}
