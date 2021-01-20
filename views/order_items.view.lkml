view: order_items {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: returned_time {
    type: date_time
    sql: ${TABLE}.returned_at ;;
    group_label: "Returned Date"
    group_item_label: "Time"
  }

  dimension: returned_date {
    type: date
    sql: ${TABLE}.returned_at ;;
    group_label: "Returned Date"
    group_item_label: "Date"
    drill_fields: [ returned_time ]
  }

  dimension: returned_week {
    type: date_week
    sql: ${TABLE}.returned_at ;;
    group_label: "Returned Date"
    group_item_label: "Week"
    drill_fields: [ returned_date, returned_time ]
  }

  dimension: returned_month {
    type: date_month
    sql: ${TABLE}.returned_at ;;
    group_label: "Returned Date"
    group_item_label: "Month"
    drill_fields: [ returned_date, returned_time, returned_week ]
  }

  dimension: returned_quarter {
    type: date_quarter
    sql: ${TABLE}.returned_at ;;
    group_label: "Returned Date"
    group_item_label: "Quarter"
    drill_fields: [ returned_date, returned_time, returned_week, returned_month ]
  }

  dimension: returned_year {
    type: date_year
    sql: ${TABLE}.returned_at ;;
    group_label: "Returned Date"
    group_item_label: "Year"
    drill_fields: [ returned_date, returned_time, returned_week, returned_month, returned_quarter ]
  }

  dimension: sale_price {
    type: number
    value_format_name: decimal_2
    sql: ${TABLE}.sale_price ;;
  }

  dimension: logo_image {
    sql: ${sale_price} ;;
    html: <img style="background-color: purple; padding: 5px;" src="https://host.docker.internal:10000/images/3.0/header/looker_logo@2x-47d9e7eb95.png"/>;;
  }

  measure: count {
    type: count
    drill_fields: [id, inventory_items.id, orders.id]
  }

  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;
    value_format: "$#,##0.00"
  }

  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;
    value_format: "$#,##0.00"
  }
}
