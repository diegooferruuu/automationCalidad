class FilterPage
    include Capybara::DSL

    def open_sorting_menu
        find('#header_container > div.header_secondary_container > div > span > select').click
    end

    def select_sorting_option(option_text)
    find('#header_container > div.header_secondary_container > div > span > select').find(:option, option_text).select_option
    end

    def get_first_product_name
    all('.inventory_item_name').first.text
    end

    def get_last_product_name
        all('.inventory_item_name').last.text
    end

    def first_product_is?(expected_name)
        get_first_product_name == expected_name
    end

    def last_product_is?(expected_name)
        get_last_product_name == expected_name
    end
end
