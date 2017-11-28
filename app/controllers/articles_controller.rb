class ArticlesController < ApplicationController
  before_action :set_article, only:[:edit,:update,:show,:destroy]
  def index
    @articles = Article.all
  end

  def new
      @article = Article.new
  end

  def create
    # debugger
    #to values sent by form
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end

  end

  def show
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article successfuly deleted"
    redirect_to articles_path
  end

  def edit
  end

  def update
    if @article.update(article_params)
        flash[:notice]= "Article updated successfully"
        redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title,:description)
    end
end