# The name of this view in Looker is "Wine Attributes"
view: wine_attributes {
  sql_table_name: `wine_data.wine_attributes` ;;

  dimension: alcalinity_of_ash {
    type: number
    sql: ${TABLE}.Alcalinity_of_ash ;;
  }

  measure: total_alcalinity_of_ash {
    type: sum
    sql: ${alcalinity_of_ash} ;;
  }

  measure: average_alcalinity_of_ash {
    type: average
    sql: ${alcalinity_of_ash} ;;
  }

  # dimension: alcohol {
  #   type: number
  #   sql: ${TABLE}.Alcohol ;;
  # }

### Dataset mentions "a chemical analysis of wines grown in the same
### region in Italy but derived from three different cultivars"
### Alcohol is our best guess at the lable for the cultivars (values 1,2,3 w/ fairly even dist.)

  dimension: cultivar {
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
