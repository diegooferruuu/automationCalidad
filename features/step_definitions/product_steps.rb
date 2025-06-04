Given('I am on the product page') do
    @product_page.visit_product_page
end

When('I add the product {string} to the cart') do |product_name|
    @product_page.click_add_to_cart_button(product_name)
end

When('I remove the product {string} from the cart') do |product_name|
    @product_page.click_remove_button(product_name)
end

Then('I should see {string} in the cart') do |product_name|
    expect(@product_page.get_product_title(product_name)).to eq(product_name)
end

Then('the cart item count should be {int}') do |count|
    expect(@product_page.get_cart_item_count).to eq(count)
end

When('I click the cart icon') do
    @product_page.click_cart_icon
end

When('I click the Continue Shopping button') do
    @product_page.click_continue_shopping_button
end

Then('I should see {string} in the product list') do |product_name|
    expect(@product_page.get_product_title(product_name)).to eq(product_name)
end

Then('the product price for {string} should be {string}') do |product_name, price|
    expect(@product_page.get_product_price(product_name)).to eq(price)
end

