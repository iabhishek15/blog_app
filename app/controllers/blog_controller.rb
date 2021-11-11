class BlogController < ApplicationController
  def add_blog 
    @article = Article.new
  end

  def show 

  end 

  def article_create
    @article = Article.new(task_params)
    respond_to do |format|
      if @article.save 
        format.html {redirect_to show_url, notice:'Article was successfully created!'}
        format.json {render :show, status: :created,location:@article}
      else 
        format.html {render :add_blog, status: :unprocessable_entity}
        format.json {render json: @article.errors, status: :unprocessable_entity }
      end 
    end
  end

  private 
  def task_params
    params.require(:article).permit(:title, :content)
  end 
end 