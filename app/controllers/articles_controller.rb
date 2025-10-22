class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles  — каталог обычных статей
  def index
    @articles = Article.published.article.order(created_at: :desc)
  end

  # GET /articles/lessons — список уроков (учебник)
  def lessons
    @articles = Article.published.lesson.order(created_at: :desc)
  end

  # GET /articles/catalog — альтернативный алиас для каталога статей
  def catalog
    @articles = Article.published.article.order(created_at: :desc)
  end

  # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(article_params) # Вариант B: без автора

    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Article was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy!
    redirect_to articles_path, notice: "Article was successfully destroyed.", status: :see_other
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    # Вариант B: без user_id
    def article_params
      params.require(:article).permit(:title, :slug, :body, :kind, :category, :reading_time_min, :status)
    end
end