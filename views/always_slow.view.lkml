explore: always_slow {
  label: "Always Slow"
  persist_for: "0 seconds"
}
#
#
#hello
view: always_slow {
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
