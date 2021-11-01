# The name of this view in Looker is "Mascots"
view: mascots {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bytecodeio-datablocks.ncaa_basketball.mascots`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Market" in Explore.

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  dimension: mascot {
    type: string
    sql: ${TABLE}.mascot ;;
  }

  dimension: mascot_common_name {
    type: string
    sql: ${TABLE}.mascot_common_name ;;
  }

  dimension: mascot_name {
    type: string
    sql: ${TABLE}.mascot_name ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: non_tax_type {
    type: string
    sql: ${TABLE}.non_tax_type ;;
  }

  dimension: tax_class {
    type: string
    sql: ${TABLE}.tax_class ;;
  }

  dimension: tax_domain {
    type: string
    sql: ${TABLE}.tax_domain ;;
  }

  dimension: tax_family {
    type: string
    sql: ${TABLE}.tax_family ;;
  }

  dimension: tax_genus {
    type: string
    sql: ${TABLE}.tax_genus ;;
  }

  dimension: tax_kingdom {
    type: string
    sql: ${TABLE}.tax_kingdom ;;
  }

  dimension: tax_order {
    type: string
    sql: ${TABLE}.tax_order ;;
  }

  dimension: tax_phylum {
    type: string
    sql: ${TABLE}.tax_phylum ;;
  }

  dimension: tax_species {
    type: string
    sql: ${TABLE}.tax_species ;;
  }

  dimension: tax_subspecies {
    type: string
    sql: ${TABLE}.tax_subspecies ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, mascot_name, mascot_common_name]
  }
}
