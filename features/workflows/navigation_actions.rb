require 'page-object'

module NavigationActions

  include PageObject::PageFactory

  def login_as_blogger
    visit_page HomePage

    on_page HomePage do |page|
      page.loginID = 'admin'
      page.password = 'admin'
      page.login
    end

  end

  def create_new_blog
    on_page HomePage do |page|
      page.newPost
    end

    on_page CreateNewBlogPage do |page|
      page.writePost = 'Hello brotha, this is my first post ever. It is pretty sick, huh?'
    end

  end

  def receive_notification
    on_page NewBlogConfirmationPage do |page|
      expect(page.response).to include 'Your post has been submitted'
    end

  end

  def top_post_should_be_my_recent_post

  end

end

