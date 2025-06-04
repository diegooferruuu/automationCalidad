Given('I am logged in as {string} with password {string}') do |username, password|
  @login_page.visit_login_page
  @login_page.enter_credentials(username, password)
  @login_page.click_login_button
end

When('I add the following products to the cart:') do |table|
  table.raw.flatten.each do |product_name|
    @cart_page.add_product(product_name)
  end
end

When('I add {string} to the cart') do |product_name|
  @cart_page.add_product(product_name)
end

When('I go to the cart') do
  @cart_page.go_to_cart
end

When('I go back to the products page') do
  @cart_page.go_to_all_products
end

When('I go to the cart again') do
  @cart_page.go_to_cart
end

When('I remove {string} from the cart') do |product_name|
  @cart_page.remove_product(product_name)
end

Then('I should see the following products in the cart:') do |table|
  table.raw.flatten.each do |product_name|
    expect(@cart_page.product_in_cart?(product_name)).to be(true), "[ERROR] Expected '#{product_name}' to be in the cart, but it wasn't."
  end
end

Then('I should not see {string} in the cart') do |product_name|
  expect(@cart_page.product_not_in_cart?(product_name)).to be(true), "[ERROR] Expected '#{product_name}' to NOT be in the cart, but it was."
end

Then('the product {string} should have:') do |product_name, table|
  expected = table.rows_hash.transform_values { |v| v.gsub(/^"|"$/, '') }
  actual = @cart_page.get_product_details(product_name)

  expect(actual[:description]).to eq(expected['description']), "[ERROR] Description mismatch for #{product_name}"
  expect(actual[:price]).to eq(expected['price']), "[ERROR] Price mismatch for #{product_name}"
end

Then('the cart counter should show {string}') do |expected_count|
  actual_count = @cart_page.cart_counter
  expect(actual_count).to eq(expected_count), "[ERROR] Expected cart counter '#{expected_count}', got '#{actual_count}'"
end

Then('the cart should be empty') do
  expect(@cart_page.cart_empty?).to be(true), "[ERROR] Expected cart to be empty, but it's not."
end
