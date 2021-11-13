class ArticleController < ApplicationController
  def new
    if current_user
      @article = Article.new
    else
      redirect_to login_path, notice: 'You are not logged in!'
    end
  end

  def show
    #TODO what if id does not exits
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html {redirect_to "/article/show/#{@article.id}", notice:'Article was successfully created!'}
        format.json {render :show, status: :created, location:@article}
      else
        format.html {render :new, status: :unprocessable_entity}
        format.json {render json: @article.errors, status: :unprocessable_entity }
        #byebug
      end
    end
  end

  def delete
    @article = Article.find(params[:id])
    #byebug
    @article.destroy
    respond_to do |format|
      format.html {redirect_to home_url, notice:'Article was successfully deleted'}
      format.json {head:no_content}
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to "/article/show/#{@article.id}", notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :user_id)
  end
end
