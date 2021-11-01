# The name of this view in Looker is "Wine Attributes"
view: wine_attributes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `wine_data.wine_attributes`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Alcalinity of Ash" in Explore.

  dimension: alcalinity_of_ash {
    type: number
    sql: ${TABLE}.Alcalinity_of_ash ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_alcalinity_of_ash {
    type: sum
    sql: ${alcalinity_of_ash} ;;
  }

  measure: average_alcalinity_of_ash {
    type: average
    sql: ${alcalinity_of_ash} ;;
  }

  dimension: alcohol {
    type: number
    sql: ${TABLE}.Alcohol ;;
  }

  dimension: ash {
    type: number
    sql: ${TABLE}.Ash ;;
  }

  dimension: color_intensity {
    type: number
    sql: ${TABLE}.Color_intensity ;;
  }

  dimension: flavanoids {
    type: number
    sql: ${TABLE}.Flavanoids ;;
  }

  dimension: hue {
    type: number
    sql: ${TABLE}.Hue ;;
  }

  dimension: int64_field_13 {
    type: number
    sql: ${TABLE}.int64_field_13 ;;
  }

  dimension: magnesium {
    type: number
    sql: ${TABLE}.Magnesium ;;
  }

  dimension: malic_acid {
    type: number
    value_format_name: id
    sql: ${TABLE}.Malic_acid ;;
  }

  dimension: nonflavanoid_phenols {
    type: number
    sql: ${TABLE}.Nonflavanoid_phenols ;;
  }

  dimension: od280_od315_of_diluted_wines {
    type: number
    sql: ${TABLE}.OD280_OD315_of_diluted_wines ;;
  }

  dimension: proanthocyanins {
    type: number
    sql: ${TABLE}.Proanthocyanins ;;
  }

  dimension: proline {
    type: number
    sql: ${TABLE}.Proline ;;
  }

  dimension: total_phenols {
    type: number
    sql: ${TABLE}.Total_phenols ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
