class ArticlesController < ApplicationController

  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new create ]
  before_action :owner?, only: %i[ edit destroy ]

  def index
    @articles = Article.ordered
  end

  def show

  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      respond_to do |format|
        format.html { redirect_to articles_path, notice: "Article was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Article was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

    if @article.update(article_params)
      respond_to do |format|
        format.html { redirect_to articles_path, notice: "Article was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Article was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_path, notice: "Article was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Article was successfully destroyed." }
    end
  end

  #######
  private
  #######

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def owner?
    unless current_user == @article.user
      redirect_back fallback_location: root_path, notice: 'User is not owner'
    end
  end

end
