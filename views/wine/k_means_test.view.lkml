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
    sql_create:
      CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
      OPTIONS(model_type='kmeans'
        , num_clusters=3
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
