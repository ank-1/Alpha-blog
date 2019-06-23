class ArticlesController < ApplicationController
  before_action :set_article,only: [:edit,:update,:destroy,:show]
  def index
    @articles=Article.all
  end

  def new
    @article=Article.new
  end

  def create
    @article=Article.new(article_params)
    @article.user= User.first
    if @article.save
      flash[:success] = "New article has been successfully created"
      redirect_to article_path(@article)
   else
     render 'new'
   end
 end

   def show
   end


def edit
end


def destroy
  @article.destroy
  flash[:danger]="Article was successfully deleted"
  redirect_to articles_path
end


  def update
    if @article.update(article_params)
      flash[:success] = "Article have been successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end


private

  def article_params
    params.require(:article).permit(:title,:description)
  end

  def set_article
    @article=Article.find(params[:id])
  end

end
