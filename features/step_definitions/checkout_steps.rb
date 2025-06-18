Given('I am logged in as a standard user') do
  @login_page = LoginPage.new
  @login_page.visit_login_page
  @login_page.enter_credentials('standard_user', 'secret_sauce')
  @login_page.click_login_button
end

Given('I have added the product {string} to the cart') do |product_name|
  product = find('div.inventory_item', text: product_name)
  @product_name = product.find('.inventory_item_name').text
  @product_price = product.find('.inventory_item_price').text.gsub('$', '').to_f
  product.find('button').click
  find('.shopping_cart_link').click
end

When('I proceed to checkout') do
  @checkout_page = CheckoutPage.new
  @checkout_page.click_checkout_button
end

When('I enter my information:') do |table|
  data = table.rows_hash
  @checkout_page.fill_checkout_information(
    first_name: data['first_name'],
    last_name: data['last_name'],
    postal_code: data['postal_code']
  )
end

When('I confirm the purchase') do
  @checkout_page.confirm_purchase
end

Then('I should see a confirmation message {string}') do |message|
  expect(@checkout_page.confirmation_message).to eq(message)
end

Then('the overview should contain the product {string}') do |product_name|
  expect(@checkout_page.product_in_overview?(product_name)).to be true
end

Then('the item total should match the price of {string}') do |product_name|
  total = @checkout_page.item_total
  expect(total).to eq(@product_price)
end

Then('the tax should be 0.08% of the total price') do
  subtotal = @checkout_page.item_total
  tax_text = find('.summary_tax_label').text
  tax = tax_text.match(/Tax: \$([\d.]+)/)[1].to_f
  
  expected_tax = (subtotal * 0.08).round(2)
  expect(tax).to eq(expected_tax)
end