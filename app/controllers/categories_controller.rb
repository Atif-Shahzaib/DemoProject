class CategoriesController < ApplicationController

    before_action :find_category, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :show,:index]
    def index
      @categories= Category.all.order("created_at DESC")
    end
  
    def new
      @category = Category.new
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      if @category.update(category_params)
        redirect_to category_path
      else
        render 'edit'
      end
    end
    
    def destroy
      @category.destroy
      return redirect_to category_path
    end
  
    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to categories_path
      else
        render 'new'
      end
    end
  
    private
  
    def category_params
      params.require(:category).permit(:title)
    end
  
    def find_category
      @category= Category.find(params[:id])
    end
  
  end