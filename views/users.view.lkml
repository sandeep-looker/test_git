view: users {
  label: "users"

  dimension: id {
    label: "id"
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    label: "age"
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: age_tier {
    type: tier
    tiers: [0,10,20,30,40,50,60,70,80]
    style: integer
   sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: city_with_link {
    label: "city with link"
    type: string
    sql: ${TABLE}.city ;;
    html: <a href="http://www.looker.com" target="_blank">prefix link</a> <b>{{value}}</b>;;
    link: {
      label: "Google Link"
      url: "http://www.google.com"
      icon_url: "http://www.google.com/favicon.ico"
    }
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
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

  dimension: dynamic_dimension {
    label_from_parameter: dynamic_dimension_allowed_values
    sql:
      {% if dynamic_dimension_allowed_values._parameter_value == "'Gender'" %}
        ${gender}
      {% elsif dynamic_dimension_allowed_values._parameter_value == "'Country'" %}
        ${country}
      {% elsif dynamic_dimension_allowed_values._parameter_value == "'Traffic Source'" %}
        ${traffic_source}
      {% else %}
        NULL
      {% endif %} ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
    description: "Customer first name"
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: lng {
    type: number
    sql: ${TABLE}.lng ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${lat} ;;
    sql_longitude: ${lng} ;;
  }

  dimension: postcode {
    type: string
    sql: ${TABLE}.postcode ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.postcode ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    drill_fields: [city]
  }

  dimension: state_with_spaces {
    type: string
    sql: concat(' ', ${TABLE}.state, ' ');;
    drill_fields: [city]
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: name_with_html {
    type: string
    sql: ${TABLE}.last_name ;;
    html: <div style="height:200px;"><b>{{rendered_value}}</b></div> ;;
  }

  parameter: dynamic_dimension_allowed_values {
    type: string
    allowed_value: { value: "Gender" }
    allowed_value: { value: "Country" }
    allowed_value: { value: "Traffic Source" }
    default_value: "Gender"
  }

  measure: count_percent_of_total {
    label: "Count (Percent of Total)"
    type: percent_of_total
    sql: ${count} ;;
    drill_fields: [id]
  }

  measure: average_age {
    type: average
    value_format_name: decimal_2
    sql: ${age} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [id, first_name, email, age, created_date]
  }

  measure: count {
    label: "count"
    type: count
    drill_fields: [id, last_name, first_name, orders.count]
  }
}
