require_relative '../workflows/navigation_actions'

include NavigationActions


Given(/^I am logged in as a blogger$/) do
  login_as_blogger
end

When(/^I publish a new blog post$/) do
  create_new_blog
end

Then(/^I am notified that the blog post was successfully added$/) do
  receive_notification
end

And(/^the newly added blog post is at the top of the recent posts list$/) do
  top_post_should_be_my_recent_post
end



Given(/^I visit the blog for my favorite blogger$/) do
  go_to_homepage
end

When(/^I choose a blog post$/) do
  choose_blog_post
end

Then(/^I should see comments left by other readers$/) do
  check_for_comments
end


#uses the above GIVEN AND WHEN
Then(/^I should see the blog post$/) do
  check_for_blog_post
end



#uses the above GIVEN AND WHEN
Then(/^the url should contain information about the post$/) do
  url_contains_post_info
end



Given(/^I am reading a blog post from my favorite blogger$/) do
  login_as_blogger
end

When(/^I add my genius comment to the blog post$/) do
  make_a_comment
end

Then(/^my genius comment is at the top of the blog post comments$/) do
  comment_should_be_at_top
end




Given(/^my favorite blogger has been very active$/) do

end

Then(/^then I should see a summary of my favorite blogger's (\d+) most recent posts in reverse order$/) do |arg|
  check_for_ten_posts
end






When(/^I search for a blog post$/) do
  search_for_blog_post
  sleep 2
end

Then(/^I should see posts with that value in the title$/) do
  check_results
end