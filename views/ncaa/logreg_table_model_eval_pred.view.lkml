include: "models_source.view"

view: logreg_model {
  derived_table: {
    persist_for: "1 hour"
    sql_create:
    CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
    OPTIONS(
    MODEL_TYPE = 'LOGISTIC_REG',
    INPUT_LABEL_COLS = ['win'],
    AUTO_CLASS_WEIGHTS = TRUE,
    MAX_ITERATIONS = 2
    ) AS
    SELECT
    win,{{field_selection.input_variables._parameter_value|remove: "'"}}
    FROM ${models_source.SQL_TABLE_NAME};;
  }

  dimension: blank {
    type: string
    sql:'jhjh' ;;
  }
}


view: logreg_eval {
  derived_table: {
    persist_for: "1 hour"
    sql:
    SELECT *
    FROM ML.EVALUATE( MODEL ${logreg_model.SQL_TABLE_NAME},
            (SELECT
               {{field_selection.input_variables._parameter_value|remove: "'"}}
               FROM ${models_source.SQL_TABLE_NAME}));;
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
    (SELECT
              *
               FROM ${models_source.SQL_TABLE_NAME})
  );;
    }

    dimension: game_id {
      type: string
      sql: ${TABLE}.game_id ;;
    }

    dimension: win {
      type: string
      sql: ${TABLE}.win ;;
    }

    dimension: predicted_win {
      type: string
      sql: ${TABLE}.predicted_win ;;
    }
  }
