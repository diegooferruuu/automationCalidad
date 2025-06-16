class CartPage
  include Capybara::DSL

  def add_product(product_name)
    find_inventory_item(product_name).find('button').click
  end

  def go_to_cart
    navigate_with_fallback('.shopping_cart_link', '/cart.html')
  end

  def go_to_all_products
    navigate_with_fallback('#continue-shopping', '/inventory.html')
  end

  def remove_product(product_name)
    selector = "##{remove_button_id(product_name)}"
    log(:info, "Attempting to remove '#{product_name}' with selector: #{selector}")

    with_error_handling(selector, product_name) do |button|
      scroll_to_element(button)
      js_click(button)
      log(:success, "JS clicked remove button for '#{product_name}'")
    end
  end

  def product_in_cart?(product_name)
    has_css?('div.cart_item', text: product_name)
  end

  def product_not_in_cart?(product_name)
    has_no_css?('div.cart_item', text: product_name)
  end

  def get_product_details(product_name)
    container = find_cart_item(product_name)
    {
      name:        container.find('.inventory_item_name').text,
      description: container.find('.inventory_item_desc').text,
      price:       container.find('.inventory_item_price').text
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

  def find_inventory_item(product_name)
    find('div.inventory_item', text: product_name)
  end

  def find_cart_item(product_name)
    find('div.cart_item', text: product_name)
  end

  def remove_button_id(name)
    "remove-#{name.downcase.strip.gsub(/[^\w\s-]/, '').gsub(/\s+/, '-')}"
  end

  def wait_until_url_includes(fragment, timeout: 5)
    start_time = Time.now
    until page.current_url.include?(fragment)
      return false if Time.now - start_time > timeout
      sleep 0.1
    end
    true
  end

  def scroll_to_element(element)
    page.execute_script(
      "arguments[0].scrollIntoView({ behavior: 'instant', block: 'center', inline: 'center' });",
      element.native
    )
  end

  def js_click(element)
    page.execute_script("arguments[0].click();", element)
  end

  def navigate_with_fallback(selector, expected_path)
    element = find(selector, visible: true, wait: 5)
    scroll_to_element(element)
    element.click

    unless wait_until_url_includes(expected_path, timeout: 5)
      log(:warn, "Native click failed, attempting JS click on #{selector}")
      js_click(element)
      raise_navigation_error(expected_path) unless wait_until_url_includes(expected_path, timeout: 5)
    end
  end

  def raise_navigation_error(target)
    raise "[ERROR] Navigation to #{target} failed. Current URL: #{page.current_url}"
  end

  def with_error_handling(selector, product_name)
    button = find(selector, visible: true, wait: 5)
    yield(button)
  rescue Capybara::ElementNotFound => e
    log(:error, "Could not find button with selector: #{selector}")
    raise e
  rescue => e
    log(:error, "Unexpected error when removing '#{product_name}' — #{e.class}: #{e.message}")
    raise e
  end

  def log(level, msg)
    prefix = {
      info:    "[INFO]",
      success: "[SUCCESS]",
      warn:    "[WARN]",
      error:   "[ERROR]"
    }[level] || "[INFO]"
    puts "#{prefix} #{msg}"
  end
end