require 'oat/adapters/hal'
class ProductSerializer < Oat::Serializer
  include Rails.application.routes.url_helpers
  adapter Oat::Adapters::HAL

  schema do
    type "product"
    link :self, href: product_path(item)
    link :order, href: orders_path

    properties do |props|
      props.name item.name
      props.price item.price
    end
  end

end