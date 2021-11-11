class BlogController < ApplicationController
  def add_blog 
    @article = Article.new
  end

  def show 
    @article = Article.find(params[:id])
  end 

  def article_create
    @article = Article.new(task_params)
    respond_to do |format|
      if @article.save 
        format.html {redirect_to "/article/show/#{@article.id}", notice:'Article was successfully created!'}
        format.json {render :show, status: :created, location:@article}
      else 
        format.html {render :add_blog, status: :unprocessable_entity}
        format.json {render json: @article.errors, status: :unprocessable_entity }
        #byebug
      end 
    end
  end

  def delete_article 
    @article = Article.find(params[:id])
    #byebug
    @article.destroy
    respond_to do |format| 
      format.html {redirect_to home_url, notice:'Article was successfully deleted'}
      format.json {head:no_content}
    end
  end 

  private 
  def task_params
    params.require(:article).permit(:title, :content)
  end 
end 