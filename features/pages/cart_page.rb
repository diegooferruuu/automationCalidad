class CartPage
  include Capybara::DSL

  def add_product(product_name)
    find('div.inventory_item', text: product_name).find('button').click
  end

  def go_to_cart
    link = find('.shopping_cart_link', visible: true, wait: 5)
    scroll_to_element(link)

    link.click
    unless wait_until_url_includes('/cart.html', timeout: 5)
      puts '[WARN] Normal click failed, trying JS click...'
      page.execute_script('arguments[0].click();', link.native)
      raise_navigation_error('/cart.html') unless wait_until_url_includes('/cart.html', timeout: 5)
    end
  end

  def go_to_all_products
    button = find("#continue-shopping", visible: true, wait: 5)
    scroll_to_element(button)
    button.click
    
    unless wait_until_url_includes('/inventory.html', timeout: 5)
      puts '[WARN] Normal click failed, trying JS click...'
      page.execute_script('arguments[0].click();', button.native)
      raise_navigation_error('/inventory.html') unless wait_until_url_includes('/inventory.html', timeout: 5)
    end
  end

  def remove_product(product_name)
    id = generate_remove_button_id(product_name)
    selector = "##{id}"

    begin
      button = find(selector, visible: true, wait: 5)

      begin
        button.click
        puts "[SUCCESS] Native clicked remove button for '#{product_name}'"
      rescue Capybara::NotClickableError => e
        puts "[WARNING] Native click failed for '#{product_name}' – attempting JS click. Error: #{e.message}"
        page.execute_script("arguments[0].click();", button)
        puts "[SUCCESS] JS clicked remove button for '#{product_name}' (after native click failed)"
      rescue => e
        puts "[ERROR] Failed native click for '#{product_name}' — #{e.class}: #{e.message}"
        raise e 
      end

    rescue Capybara::ElementNotFound => e
      puts "[ERROR] Could not find button with selector: #{selector}"
      raise e 
    rescue => e
      puts "[ERROR] An unexpected error occurred before clicking for '#{product_name}' — #{e.class}: #{e.message}"
      raise e 
    end
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

  def generate_remove_button_id(name)
    kebab = name.downcase.strip
                .gsub(/[^\w\s-]/, '')  
                .gsub(/\s+/, '-')      
    "remove-#{kebab}"
  end


  def wait_until_url_includes(fragment, timeout: 5)
    start_time = Time.now
    until page.current_url.include?(fragment)
      return false if Time.now - start_time > timeout
      sleep 0.1
    end
    true
  end

  def raise_navigation_error(target)
    raise "[ERROR] Navigation to #{target} failed. Current URL: #{page.current_url}"
  end

  def scroll_to_element(element)
    script = <<~JS
      arguments[0].scrollIntoView({ behavior: 'instant', block: 'center', inline: 'center' });
    JS
    page.execute_script(script, element.native)
  end
end
