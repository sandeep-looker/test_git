view: products {
  label: "products"

  dimension: id {
    label: "id"
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
    html: <a href="http://www.google.com" target="_blank">{{ value }}</a>;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
    action: {
      label: "Create Dashboard"
      url: "https://host.docker.internal:10000/api/internal/dataflux/dashboards"
      icon_url: "https://host.docker.internal:10000/images/favicon.ico"
      param: {
        name: "preferred_viewer"
        value: "dashboards-next"
      }
      user_attribute_param: {
        user_attribute: email
        name: "user_email"
      }
      form_param: {
        name: "title"
        type: select
        label: "Select dashboard name"
        description: "select the name for your dashboard"
        required: yes
        default: "actions-test-1"
        option: {
          label: "actions test 1"
          name: "actions-test-1"
        }
        option: {
          label: "actions test 2"
          name: "actions-test-2"
        }
        option: {
          label: "actions test 3"
          name: "actions-test-3"
        }
      }
      form_param: {
        name: "space_id"
        type: string
        label: "Enter folder id"
        required: yes
      }
    }
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    label: "item_name"
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }

  parameter: rank_paramter {
    type: number
    label: "Rank Filter Parameter"
    suggest_dimension: products.rank
    allowed_value: {
      label: "Rank 1"
      value: "1"
    }
    allowed_value: {
      label: "Rank 2"
      value: "2"
    }
    allowed_value: {
      label: "Rank 3"
      value: "3"
    }
  }
}
