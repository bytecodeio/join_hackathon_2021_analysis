include: "models_source.view"

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
                    point_margin,{{field_selection.input_variables._parameter_value|remove: "'"}}
                  FROM ${models_source.SQL_TABLE_NAME};;
  }
  dimension: something {type: string sql:'jhgjh';;}
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
              {{field_selection.input_variables._parameter_value|remove: "'"}}
               FROM ${models_source.SQL_TABLE_NAME}));;
  }
  dimension: mean_absolute_error {type: number}
  dimension: mean_squared_error {type: number}
  dimension: mean_squared_log_error {type: number}
  dimension: median_absolute_error {type: number}
  dimension: r2_score {type: number}
  dimension: explained_variance {type: number}
}


view: regression_prediction {
  derived_table: {
    sql:
            SELECT
              *
            FROM ml.PREDICT(
               MODEL ${point_margin_regression.SQL_TABLE_NAME},
               (SELECT
                  *
                FROM ${models_source.SQL_TABLE_NAME}));;
  }
  dimension: game_id {
    type: string
    sql: ${TABLE}.game_id ;;
  }
  dimension: predicted_point_margin {type: number}
  dimension: residual {
    type: number
    sql: ${predicted_point_margin} - ${TABLE}.point_margin;;}
}
