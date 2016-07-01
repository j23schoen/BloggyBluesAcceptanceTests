require 'page-object'

class BloggyBluesProfile

  include PageObject

  div(:author_name, :id => 'author')
  divs(:posts, :class => 'posts')

end