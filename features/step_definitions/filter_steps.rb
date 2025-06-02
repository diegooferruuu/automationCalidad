require_relative '../pages/filter_page'

filter_page = FilterPage.new

When('I click the sorting options menu button') do
    filter_page.open_sorting_menu
end

When('I select {string} from the sorting filter') do |option_text|
    filter_page.select_sorting_option(option_text)
end

Then('the first displayed product should be {string}') do |expected_product|
    actual_product = filter_page.get_first_product_name
    raise "Expected first product: #{expected_product}, but got: #{actual_product}" unless actual_product == expected_product
end

Then('the last displayed product should be {string}') do |expected_product|
    actual_product = filter_page.get_last_product_name
    raise "Expected last product: #{expected_product}, but got: #{actual_product}" unless actual_product == expected_product
end
