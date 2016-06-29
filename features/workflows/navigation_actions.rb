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

  #id be amazed if it does get the first div out of a collection of divs
  def top_post_should_be_my_recent_post
    on_page BloggyBluesHome do |page|
      expect(page.latest_post_element.first).to include 'Automated Test'
    end
  end





  def visit_favorite_blogger
    on_page BloggyBluesHome do |page|
      page.ajax_text_field = 'phil'
      page.ajax_search
    end
  end


  def choose_blog_post
    on_page BloggyBluesProfile do |page|
      expect(page.author).to include 'phil'
      page.posts_element.first.click
    end
  end

#.exists? probably aint right
  def check_for_comments
    on_page BloggyBluesShowPosts do |page|
      expect(page.comments).exists?
    end
  end


#url is not 100% accurate
  def url_contains_post_info
    on_page BloggyBluesShowPosts do |page|
      expect(page.url).to include 'http://localhost:8080/BloggyBlues/bloggyBlues/show/'
    end
  end

  def make_a_comment
    on_page BloggyBluesShowPosts do |page|
      page.reply
      page.comment_text = 'Your Automated Test Is Working Great!'
      page.submit
    end
  end

  def comment_should_be_at_top
    on_page BloggyBluesShowPosts do |page|
      expect(page.comments_element.first).to include 'Your Automated Test Is Working Great!'
    end
  end



  def check_for_blog_post
    on_page BloggyBluesShowPost do |page|
      expect(page.post).to include 'Automated Test'
    end

  end

end