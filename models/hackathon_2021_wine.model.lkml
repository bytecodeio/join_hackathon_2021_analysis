connection: "hackathon-wine"

include: "/views/wine/**/*.view"


datagroup: hackathon_2021_wine_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: hackathon_2021_wine_default_datagroup


explore: wine_attributes {}

explore: k_means_prediction {}
