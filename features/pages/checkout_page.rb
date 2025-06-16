class CheckoutPage
  include Capybara::DSL

  def click_checkout_button
    click_button('checkout')
  end

  def fill_checkout_information(first_name:, last_name:, postal_code:)
    fill_in 'First Name', with: first_name
    fill_in 'Last Name', with: last_name
    fill_in 'Zip/Postal Code', with: postal_code
    click_button('Continue')
  end

  def confirm_purchase
    click_button('Finish')
  end

  def confirmation_message
    find('.complete-header').text
  end

  def product_in_overview?(product_name)
    has_css?('.cart_item', text: product_name)
  end

  def item_total
    find('.summary_subtotal_label').text.match(/Item total: \$([\d.]+)/)[1].to_f
  end
end