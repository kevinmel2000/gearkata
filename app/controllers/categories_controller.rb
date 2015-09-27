class CategoriesController < ApplicationController

  before_action :authenticate_user!, except: [:show]

  def show
    @category = Category.friendly.find(params[:id])
  end

  def new
    @category = current_user.categories.new

    authorize! :manage, @category
  end

  def create
    @category = current_user.categories.new(item_params)

    authorize! :manage, @category

    if @category.save
      flash[:notice] = "Created #{@category.name}"
      redirect_to root_path
    else
      render :edit
    end
  end

  def edit
    @category = current_user.categories.friendly.find(params[:id])

    authorize! :manage, @category
  end

  def update
    @category = current_user.categories.friendly.find(params[:id])

    authorize! :manage, @category

    if @category.update_attributes(item_params)
      flash[:notice] = "Updated #{@category.name}"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

    def item_params
      params.require(:category).permit(:name, :description)
    end
end
