class ItemsController < ApplicationController

  def index
  end

  def new
    @item = current_user.items.new

    authorize! :manage, @item
  end

  def create
    @item = current_user.items.new(item_params)

    authorize! :manage, @item

    if @item.save
      flash[:notice] = "Created #{@item.name}"
      redirect_to new_item_path
    else
      render :new
    end
  end

  def edit
    @item = find_item(params)

    authorize! :manage, @item
  end

  def update
    @item = find_item(params)

    authorize! :manage, @item

    if @item.update_attributes(item_params)
      flash[:notice] = "Updated #{@item.name}"
      redirect_to items_path(@item)
    else
      render :edit
    end
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :default_amount, :blessed)
    end

    def find_item(params)
      if current_user.admin?
        Item.find(params[:id])
      else
        current_user.items.find(params[:id])
      end
    end

end
