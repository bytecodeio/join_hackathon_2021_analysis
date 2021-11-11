view: k_means_training_input_mbb {
  derived_table: {
    persist_for: "24 hours"
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

view: k_means_model_mbb {
  derived_table: {
    persist_for: "24 hours"
    sql_create:
      CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
      OPTIONS(
      -- Add liquid here if possible for user selected model type/ number of clusters
          model_type='kmeans'
        -- , num_clusters=3
        ) AS
      SELECT
        *
      FROM ${k_means_training_input_mbb.SQL_TABLE_NAME};;
  }
}

view: k_means_evaluation_mbb {
  derived_table: {
    sql: SELECT * FROM ml.EVALUATE(
          MODEL ${k_means_model_mbb.SQL_TABLE_NAME},
          (SELECT * FROM ${k_means_training_input_mbb.SQL_TABLE_NAME}));;
  }

  dimension: davies_bouldin_index {
    type: number
    sql: ${TABLE}.davies_bouldin_index ;;
  }

  dimension: mean_squared_distance {
    type: number
    sql: ${TABLE}.mean_squared_distance ;;
  }
}

view: k_means_prediction_mbb {
  derived_table: {
    sql:
      SELECT
        *
      FROM
        ML.PREDICT( MODEL ${k_means_model_mbb.SQL_TABLE_NAME},
          (
          SELECT
            *
          FROM
            (
              SELECT
                 points - opp_points as point_margin,
                 assists_turnover_ratio,
                 opp_assists_turnover_ratio,
                 field_goals_pct,
                 opp_field_goals_pct,
              FROM `bytecodeio-datablocks.ncaa_basketball.mbb_teams_games_sr`
              WHERE home_team = TRUE
                -- adding this limit the dataset to a random 25% sample
                AND RAND() <= 0.25))) ;;
  }

  dimension: predicted_cluster {
    type: number
    sql: ${TABLE}.CENTROID_ID ;;
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

  measure: number_of_games {
    type: count
  }

  measure: average_point_margin {
    type: average
    sql: ${point_margin} ;;
  }

  measure: avg_assists_turnover_ratio {
    type: average
    sql: ${assists_turnover_ratio} ;;
  }

  measure: avg_opp_assists_trunover_ratio {
    type: average
    sql: ${opp_assists_turnover_ratio} ;;
  }

  measure: avg_field_goal_pct {
    type: average
    sql: ${field_goals_pct} ;;
  }

  measure: avg_opp_field_goal_pct {
    type: average
    sql: ${opp_field_goals_pct} ;;
  }


}
