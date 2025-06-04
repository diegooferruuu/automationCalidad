module PagesHelper
  def login_page
    @login_page ||= LoginPage.new
  end

  def cart_page
    @cart_page ||= CartPage.new
  end

  def checkout_page
    @checkout_page ||= CheckoutPage.new
  end
end

World(PagesHelper)
