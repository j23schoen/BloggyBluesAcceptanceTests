require 'page-object'
require_relative '../workflows/login_to_blog'

include LoginToBloggyBlues

module NavigationActions

  include PageObject::PageFactory

  def go_to_homepage
    visit_homepage
  end

  def login_as_blogger
    visit_homepage
    navigate_to_login_page
    enter_credentials
    check_for_correct_user_credentials
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
    on_page BloggyBluesShowPost do |page|

      expect(page.successful_post).to include 'Your post has been submitted'
      page.home
    end

  end

  def top_post_should_be_my_recent_post
    on_page BloggyBluesHome do |page|
      expect(page.last_post).to include 'Automated Test'
    end
  end




  def choose_blog_post
    on_page BloggyBluesHome do |page|
      page.most_recent_post
    end
  end

#.exists? probably aint right
  def check_for_comments
    on_page BloggyBluesShowPosts do |page|
      expect(page.comments).exists?
    end
  end


#url is not 100% accurate but will get the url
  def url_contains_post_info
    expect(on_page(BloggyBluesShowPost).current_url) == "localhost:8080/BloggyBlues/bloggyblues/show/"
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
      expect(page.post).to include 'By'
    end

  end

  def check_for_ten_posts
    on_page BloggyBluesHome do |page|
      number_of_divs = page.all_posts_elements.size
      expect(number_of_divs).to eq(10)
    end
  end

  def search_for_blog_post
    on_page BloggyBluesHome do |page|
      page.search_text_field = 'A'
      page.search_submit
    end
  end

  def check_results
    on_page BloggyBluesHome do |page|
      expect(page.search_results).to include 'A' or 'a'
    end
  end

end