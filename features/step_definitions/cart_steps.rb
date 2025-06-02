Given('I am logged in as {string} with password {string}') do |username, password|
  @login.visit_login_page
  @login.enter_credentials(username, password)
  @login.click_login_button
end

When('I add the following products to the cart:') do |table|
  table.raw.flatten.each do |product_name|
    @cart.add_product(product_name)
  end
end

When('I add {string} to the cart') do |product_name|
  @cart.add_product(product_name)
end

When('I go to the cart') do
  @cart.go_to_cart
end

When('I go back to the products page') do
  @cart.go_to_all_products
end

When('I go to the cart again') do
  @cart.go_to_cart
end

When('I remove {string} from the cart') do |product_name|
  @cart.remove_product(product_name)
end

Then('I should see the following products in the cart:') do |table|
  table.raw.flatten.each do |product_name|
    expect(@cart.product_in_cart?(product_name)).to be(true), "[ERROR] Expected '#{product_name}' to be in the cart, but it wasn't."
  end
end

Then('I should not see {string} in the cart') do |product_name|
  expect(@cart.product_not_in_cart?(product_name)).to be(true), "[ERROR] Expected '#{product_name}' to NOT be in the cart, but it was."
end

Then('the product {string} should have:') do |product_name, table|
  expected = table.rows_hash.transform_values { |v| v.gsub(/^"|"$/, '') }
  actual = @cart.get_product_details(product_name)

  expect(actual[:description]).to eq(expected['description']), "[ERROR] Description mismatch for #{product_name}"
  expect(actual[:price]).to eq(expected['price']), "[ERROR] Price mismatch for #{product_name}"
end

Then('the cart counter should show {string}') do |expected_count|
  actual_count = @cart.cart_counter
  expect(actual_count).to eq(expected_count), "[ERROR] Expected cart counter '#{expected_count}', got '#{actual_count}'"
end

Then('the cart should be empty') do
  expect(@cart.cart_empty?).to be(true), "[ERROR] Expected cart to be empty, but it's not."
end
