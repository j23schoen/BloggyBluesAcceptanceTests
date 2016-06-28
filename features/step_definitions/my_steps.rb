require_relative '../workflows/navigation_actions'

include NavigationActions


Given(/^I am logged in as a blogger$/) do
  login_as_blogger
  sleep 2
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
  visit_favorite_blogger
end

When(/^I choose a blog post$/) do
  choose_blog_post
end

Then(/^I should see comments left by other readers$/) do
  check_for_comments
end

