class CartPage
  include Capybara::DSL

  def add_product(product_name)
    find('div.inventory_item', text: product_name).find('button').click
  end

  def go_to_cart
    find('.shopping_cart_link').click
  end

  def remove_product(product_name)
    id = "remove-#{kebab_case(product_name)}"
    find("##{id}").click
  end

  def product_in_cart?(product_name)
    has_css?('div.cart_item', text: product_name)
  end

  def product_not_in_cart?(product_name)
    has_no_css?('div.cart_item', text: product_name)
  end

  def get_product_details(product_name)
    container = find('div.cart_item', text: product_name)
    {
      name: container.find('.inventory_item_name').text,
      description: container.find('.inventory_item_desc').text,
      price: container.find('.inventory_item_price').text
    }
  end

  def cart_counter
   find('.shopping_cart_badge', wait: 2).text
  rescue Capybara::ElementNotFound
    "0"
  end

  def cart_empty?
   has_no_css?('div.cart_item')
  end

  private

  def kebab_case(name)
    name.downcase.gsub(/\s+/, '-')
  end
end
