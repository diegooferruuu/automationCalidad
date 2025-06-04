Given('I am logged in as a standard user') do
  @login_page.visit_login_page
  @login_page.enter_credentials('standard_user', 'secret_sauce')
  @login_page.click_login_button
end

Given('I have added a product to the cart') do
  @added_product = find('div.inventory_item', match: :first)
  @product_name = @added_product.find('.inventory_item_name').text
  @product_price = @added_product.find('.inventory_item_price').text.gsub('$', '').to_f
  @added_product.find('button').click
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

Then('the overview should contain the product I added') do
  expect(@checkout_page.product_in_overview?(@product_name)).to be true
end

Then('the item total should match the product price') do
  total = @checkout_page.item_total
  expect(total).to eq(@product_price)
end

Then('the cart should be empty after purchase') do
  find('.shopping_cart_link').click
  expect(page).to have_no_css('.cart_item')
end
