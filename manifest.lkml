project_name: "hackathon_2021_analysis"

application: hackathon_analysis {
  label: "Hackathon 2021 Analysis"
  url: "http://localhost:8080/bundle.js"
  #file: "bundle.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
    use_form_submit: yes
    use_embeds: yes
    core_api_methods: ["all_connections","all_projects","all_groups"
      , "all_users", "all_folders"
      , "search_folders", "run_inline_query", "me"
      , "lookml_model_explore", "all_lookml_models", "search_dashboard_elements", "run_query", "dashboard","all_user_attributes"]
    oauth2_urls: ["https://*.looker.com", "https://*.bytecode.io"]
    external_api_urls: ["https://*.looker.com", "https://*.bytecode.io"]
  }
}
