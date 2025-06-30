class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    def show
        # byebug
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
        # redirect_to article_path(@article)
            redirect_to @article, notice: 'Article was successfully created.'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        # byebug
        if @article.update(article_params)
            redirect_to @article, notice: "Article was updated successfully"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private
    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

end