class HomeController < ApplicationController
  def index
    @lesson_previews = Article.published.lesson.limit(6)
    @article_previews = Article.published.article.limit(6)
    @gallery_previews = CommunityPost.visible.gallery.limit(6)
    @meetups = Meetup.upcoming.limit(3)
  end

  def about; end
end