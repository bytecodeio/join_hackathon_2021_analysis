view: logreg_table {
  derived_table: {
    sql:
    SELECT
    assists,
    assists_turnover_ratio,
    defensive_rebounds / NULLIF(defensive_rebounds+opp_offensive_rebounds,0) as def_rebound_pct,
    blocks,
    defensive_rebounds,
    offensive_rebounds,
    COALESCE(fast_break_pts,0) as fast_break_points,
    field_goals_pct,
    free_throws_pct,
    second_chance_pts,
    steals,
    three_points_pct,
    two_points_pct,
    win
    FROM `bytecodeio-datablocks.ncaa_basketball.mbb_teams_games_sr`
    LIMIT 1000;;
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


view: logreg_model {
  derived_table: {
    persist_for: "1 hour"
    sql_create:
    CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
    OPTIONS(
    MODEL_TYPE = 'LOGISTIC_REG',
    INPUT_LABEL_COLS = ['win'],
    AUTO_CLASS_WEIGHTS = TRUE,
    MAX_ITERATIONS = 10
    ) AS
    SELECT
                     *
                  FROM ${logreg_table.SQL_TABLE_NAME};;
  }
}


view: logreg_eval {
  derived_table: {
    persist_for: "1 hour"
    sql:
    SELECT *
    FROM ML.EVALUATE( MODEL ${logreg_model.SQL_TABLE_NAME},
            (SELECT
                 *
               FROM ${logreg_table.SQL_TABLE_NAME}));;
  }

  dimension: precision {
    type: number
  }

  dimension: recall {
    type: number
  }

  dimension: accuracy {
    type: number
  }

  dimension: f1_score {
    type: number
  }

  dimension: log_loss {
    type: number
  }

  dimension: roc_auc {
    type: number
  }

  }

  view: logreg_pred {
    derived_table: {
      persist_for: "1 hour"
      sql:
      SELECT
  *
FROM
  ML.PREDICT (MODEL ${logreg_model.SQL_TABLE_NAME},
    (
    SELECT
      *
    FROM
      ${logreg_table.SQL_TABLE_NAME}
     )
  );;
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

    dimension: predicted_win {
      type: string
      sql: ${TABLE}.predicted_win ;;
    }

    # dimension: predicted_win_probs {
    #   type: string
    #   sql: ${TABLE}.predicted_win_probs ;;
    # }
  }
