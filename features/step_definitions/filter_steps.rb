When('hago clic en el botón del menú de opciones de ordenamiento') do
    find('#header_container > div.header_secondary_container > div > span > select').click
end

When('selecciono {string} en el filtro de ordenamiento') do |string|
    option = find('#header_container > div.header_secondary_container > div > span > select').find(:option, string)
    option.select_option
end

Then('el primer producto mostrado debería ser {string}') do |expected_product|
    first_product = all('.inventory_item_name').first.text
    if first_product == expected_product
        puts "El primer producto es correcto: #{first_product}"
    else
        raise "El primer producto no es correcto. Se esperaba: #{expected_product}, pero se encontró: #{first_product}"
    end
end

Then('el último producto mostrado debería ser {string}') do |expected_product|
    last_product = all('.inventory_item_name').last.text
    if last_product == expected_product
        puts "El último producto es correcto: #{last_product}"
    else
        raise "El último producto no es correcto. Se esperaba: #{expected_product}, pero se encontró: #{last_product}"
    end
end
