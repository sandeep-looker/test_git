view: inventory_items {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: created_time {
    type: date_time
    sql: ${TABLE}.created_at ;;
    group_label: "Created Date"
    group_item_label: "Time"
  }

  dimension: created_date {
    type: date
    sql: ${TABLE}.created_at ;;
    group_label: "Created Date"
    group_item_label: "Date"
    drill_fields: [ created_time ]
  }

  dimension: created_week {
    type: date_week
    sql: ${TABLE}.created_at ;;
    group_label: "Created Date"
    group_item_label: "Week"
    drill_fields: [ created_date, created_time ]
  }

  dimension: created_month {
    type: date_month
    sql: ${TABLE}.created_at ;;
    group_label: "Created Date"
    group_item_label: "Month"
    drill_fields: [ created_date, created_time, created_week ]
  }

  dimension: created_quarter {
    type: date_quarter
    sql: ${TABLE}.created_at ;;
    group_label: "Created Date"
    group_item_label: "Quarter"
    drill_fields: [ created_date, created_time, created_week, created_month ]
  }

  dimension: created_year {
    type: date_year
    sql: ${TABLE}.created_at ;;
    group_label: "Created Date"
    group_item_label: "Year"
    drill_fields: [ created_date, created_time, created_week, created_month, created_quarter ]
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: sold_time {
    type: date_time
    sql: ${TABLE}.sold_at ;;
    group_label: "Sold Date"
    group_item_label: "Time"
  }

  dimension: sold_date {
    type: date
    sql: ${TABLE}.sold_at ;;
    group_label: "Sold Date"
    group_item_label: "Date"
    drill_fields: [ sold_time ]
  }

  dimension: sold_week {
    type: date_week
    sql: ${TABLE}.sold_at ;;
    group_label: "Sold Date"
    group_item_label: "Week"
    drill_fields: [ sold_date, sold_time ]
  }

  dimension: sold_month {
    type: date_month
    sql: ${TABLE}.sold_at ;;
    group_label: "Sold Date"
    group_item_label: "Month"
    drill_fields: [ sold_date, sold_time, sold_week ]
  }

  dimension: sold_quarter {
    type: date_quarter
    sql: ${TABLE}.sold_at ;;
    group_label: "Sold Date"
    group_item_label: "Quarter"
    drill_fields: [ sold_date, sold_time, sold_week, sold_month ]
  }

  dimension: sold_year {
    type: date_year
    sql: ${TABLE}.sold_at ;;
    group_label: "Sold Date"
    group_item_label: "Year"
    drill_fields: [ sold_date, sold_time, sold_week, sold_month, sold_quarter ]
  }

  measure: count {
    type: count
    drill_fields: [id, products.item_name, products.id, order_items.count]
  }
}
