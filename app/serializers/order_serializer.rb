require 'oat/adapters/hal'
class OrderSerializer < Oat::Serializer
  include Rails.application.routes.url_helpers
  adapter Oat::Adapters::HAL

  schema do
    type "order"
    link :self, href: order_path(item)

    properties do |props|
      props.product_id item.product_id
      props.count item.count
    end
  end
end