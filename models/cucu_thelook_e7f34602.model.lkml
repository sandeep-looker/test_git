connection: "cucu-thelook-connection"

# include all the views
include: "/views/*.view"

# include all the dashboards
include: "/*.dashboard"

datagroup: cucu_thelook_e7f34602_default_datagroup {
  sql_trigger: SELECT now() ;;
  max_cache_age: "1 hour"
}

persist_with: cucu_thelook_e7f34602_default_datagroup

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

# Only put the products/users explores in here
# their views are the only ones we will localize below
explore: products {
  label: "products"
}

explore: users {
  label: "users"
}

explore: xss {}
