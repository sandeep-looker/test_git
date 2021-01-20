explore: slow_but_cacheable {
  label: "Slow But Cacheable"
  persist_for: "60 seconds"
}
view: slow_but_cacheable {
  derived_table: {
    sql: SELECT SLEEP(20), 42 as age, 1 as id ;;
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
