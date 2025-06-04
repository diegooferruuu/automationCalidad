class CheckoutPage
  include Capybara::DSL

  def click_checkout_button
    click_button('checkout')
  end

  def fill_checkout_information(first_name:, last_name:, postal_code:)
    script = <<-JS
      function fillField(selector, value) {
        const field = document.querySelector(selector);
        const nativeSetter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "value").set;
        nativeSetter.call(field, value);
        field.dispatchEvent(new Event('input', { bubbles: true }));
      }
      fillField('[data-test="firstName"]', #{first_name.to_json});
      fillField('[data-test="lastName"]', #{last_name.to_json});
      fillField('[data-test="postalCode"]', #{postal_code.to_json});
    JS
    page.execute_script(script)
    page.execute_script("document.querySelector('[data-test=\"continue\"]').click()")
  end

  def confirm_purchase
    script = <<-JS
      document.querySelector('button[data-test="finish"]').click();
    JS
    page.execute_script(script)
  end


  def confirmation_message
    find('.complete-header').text
  end

  def product_in_overview?(product_name)
    find('.cart_item').has_text?(product_name)
  end

  def item_total
    find('.summary_subtotal_label').text.match(/Item total: \$([\d.]+)/)[1].to_f
  end
end
