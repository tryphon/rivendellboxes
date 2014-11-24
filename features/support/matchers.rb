require 'rspec/matchers'

RSpec::Matchers.define :have_cart_matching do |attributes|
  match do |carts|
    carts.any? do |cart|
      attributes.all? do |attribute, value|
        cart.send(attribute) == value
      end
    end
  end
end
