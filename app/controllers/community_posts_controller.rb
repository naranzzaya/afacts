class CommunityPostsController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!, except: %i[index show]

  # GET /community_posts
  def index
    @community_posts = CommunityPost.visible.order(created_at: :desc)
  end

  # GET /community_posts/1
  def show
  end

  # GET /community_posts/new
  def new
  end

  # GET /community_posts/1/edit
  def edit
  end

  # POST /community_posts
  def create
    # подмешиваем user_id текущего пользователя
    @community_post.user = current_user

    if @community_post.save
      redirect_to @community_post, notice: "Пост опубликован"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /community_posts/1
  def update
    if @community_post.update(community_post_params)
      redirect_to @community_post, notice: "Пост обновлён"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /community_posts/1
  def destroy
    @community_post.destroy!
    redirect_to community_posts_path, notice: "Пост удалён"
  end

  private

  def community_post_params
    params.require(:community_post)
          .permit(:title, :body, :post_type, :status, { media: [] })
  end
end