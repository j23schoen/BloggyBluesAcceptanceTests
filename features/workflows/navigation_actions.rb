require 'page-object'

module NavigationActions

  include PageObject::PageFactory

  def login_as_blogger
    visit_page BloggyBluesHome

    on_page BloggyBluesHome do |page|
      page.login
    end

    on_page BloggyBluesLogin do |page|
      page.name = 'admin'
      page.password = 'admin'
      page.submit
    end

    on_page BloggyBluesHome do |page|
      expect(page.current_user).to include 'Hello, phil'
    end
  end

  def create_new_blog
    on_page BloggyBluesHome do |page|
      page.new_blog
    end

    on_page BloggyBluesCreateBlog do |page|
      page.title = 'Automated Test'
      page.content = 'Hello World'
      page.create
    end

  end

  def receive_notification
    on_page BloggyBluesHome do |page|
      expect(page.successful_post).to include 'Your post has been submitted'
    end

  end

  def top_post_should_be_my_recent_post
    on_page BloggyBluesHome do |page|
      expect(page.latest_post_element.first).to include 'Automated Test'
    end
  end





  def visit_favorite_blogger

  end


  def choose_blog_post
    # code here
  end


  def check_for_comments
    # code here
  end

end