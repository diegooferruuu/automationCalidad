class FooterPage
  include Capybara::DSL

  def twitter_link
    find('a[href="https://twitter.com/saucelabs"]', visible: :all)
  end

  def facebook_link
    find('a[href="https://www.facebook.com/saucelabs"]', visible: :all)
  end

  def linkedin_link
    find('a[href="https://www.linkedin.com/company/sauce-labs/"]', visible: :all)
  end

  def click_twitter
    twitter_link.click
  end

  def click_facebook
    facebook_link.click
  end

  def click_linkedin
    linkedin_link.click
  end
end
