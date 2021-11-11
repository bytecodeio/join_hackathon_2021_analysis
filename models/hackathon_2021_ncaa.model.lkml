# Define the database connection to be used for this model.
connection: "hackathon-wine"

# include all the views
include: "/views/ncaa/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: hackathon_2021_ncaa_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: hackathon_2021_ncaa_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Hackathon 2021 Wine"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: training_dataset {}

explore: training_dataset_dt {}

explore: mascots {}

explore: mbb_games_sr {}

explore: mbb_historical_teams_games {}

explore: mbb_historical_teams_seasons {}

explore: mbb_historical_tournament_games {}

explore: mbb_pbp_sr {}

explore: mbb_players_games_sr {}

explore: mbb_teams {}

explore: mbb_teams_games_sr {}

explore: team_colors {}


explore: regression_source {}

explore: point_margin__eval{}

explore: logreg_eval {}

explore: logreg_pred {}

explore: k_means_evaluation_mbb {}

explore: k_means_prediction_mbb {}
