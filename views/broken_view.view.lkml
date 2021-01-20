explore: broken_view {
  label: "Broken View"
  persist_for: "0 seconds"
}
view: broken_view {
  derived_table: {
    sql: SELECT CONVERT(INT, 'foo') from orders ;;
  }

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  measure: age {
    type: number
    sql: ${TABLE}.age ;;
  }
}
