class CategoriesController < ApplicationController
  def index
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to my_account_path, notice: "Category created!"
    else
      render :new
    end
  end

  private

  def category_params
    (params.require(:category).permit(:name))
  end
end
