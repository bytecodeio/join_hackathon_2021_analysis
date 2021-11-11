# If necessary, uncomment the line below to include explore_source.
# include: "hackathon_2021_wine.model.lkml"

view: k_means_training_input {
  derived_table: {
    explore_source: wine_attributes {
      column: alcalinity_of_ash {}
      column: ash {}
      column: color_intensity {}
      column: flavanoids {}
      column: hue {}
      column: magnesium {}
      column: malic_acid {}
      column: nonflavanoid_phenols {}
      column: od280_od315_of_diluted_wines {}
      column: proanthocyanins {}
      column: proline {}
      column: total_phenols {}
    }
  }
  dimension: alcalinity_of_ash {
    type: number
  }
  dimension: ash {
    type: number
  }
  dimension: color_intensity {
    type: number
  }
  dimension: flavanoids {
    type: number
  }
  dimension: hue {
    type: number
  }
  dimension: magnesium {
    type: number
  }
  dimension: malic_acid {
    value_format: "0"
    type: number
  }
  dimension: nonflavanoid_phenols {
    type: number
  }
  dimension: od280_od315_of_diluted_wines {
    type: number
  }
  dimension: proanthocyanins {
    type: number
  }
  dimension: proline {
    type: number
  }
  dimension: total_phenols {
    type: number
  }
}

view: k_means_model {
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
      FROM ${k_means_training_input.SQL_TABLE_NAME};;
  }
}

view: k_means_evaluation {
  derived_table: {
    sql: SELECT * FROM ml.EVALUATE(
          MODEL ${k_means_model.SQL_TABLE_NAME},
          (SELECT * FROM ${k_means_training_input.SQL_TABLE_NAME};;
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


view: k_means_prediction {
  derived_table: {
    sql:
      SELECT
        *
      FROM
        ML.PREDICT( MODEL ${k_means_model.SQL_TABLE_NAME},
          (
          SELECT
            *
          FROM ${wine_attributes.SQL_TABLE_NAME})) ;;
  }

  dimension: predicted_cluster {
    type: number
    sql: ${TABLE}.CENTROID_ID ;;
  }

  dimension: cultivar {
    type: number
    sql: ${TABLE}.Alcohol ;;
  }

  dimension: malic_acid {
    type: number
    sql: ${TABLE}.Malic_acid ;;
  }

  dimension: ash {
    type: number
    sql: ${TABLE}.Ash ;;
  }

  dimension: alcalinity_of_ash {
    type: number
    sql: ${TABLE}.Alcalinity_of_ash ;;
  }

  dimension: magnesium {
    type: number
    sql: ${TABLE}.Magnesium ;;
  }

  dimension: total_phenols {
    type: number
    sql: ${TABLE}.Total_phenols ;;
  }

  dimension: flavanoids {
    type: number
    sql: ${TABLE}.Flavanoids ;;
  }

  dimension: nonflavanoid_phenols {
    type: number
    sql: ${TABLE}.Nonflavanoid_phenols ;;
  }

  dimension: proanthocyanins {
    type: number
    sql: ${TABLE}.Proanthocyanins ;;
  }

  dimension: color_intensity {
    type: number
    sql: ${TABLE}.Color_intensity ;;
  }

  dimension: hue {
    type: number
    sql: ${TABLE}.Hue ;;
  }

  dimension: od280_od315_of_diluted_wines {
    type: number
    sql: ${TABLE}.OD280_OD315_of_diluted_wines ;;
  }

  dimension: proline {
    type: number
    sql: ${TABLE}.Proline ;;
  }

  dimension: correct_prediction {
    type: number
    sql: CASE WHEN ${predicted_cluster} = ${cultivar} THEN 1 ELSE 0 END;;
  }
}
