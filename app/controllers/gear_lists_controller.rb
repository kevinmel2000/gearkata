class GearListsController < ApplicationController

  before_filter :authenticate_user!, except: [:show, :view]

  def show
    @gear_list = GearList.friendly.find(params[:id])

    respond_to do |format|
      format.html

      # TODO: Render this using JBuilder (https://github.com/rails/jbuilder)
      # Think this through carefully for the format. Don't need this for v1
      #format.json { render json: @gear_list }
    end
  end

  def new
    @gear_list = current_user.gear_lists.new(name: 'New list')
    @items = draggable_items(current_user, @gear_list)
  end

  def create
    @gear_list = current_user.gear_lists.new(gear_list_params)

    authorize! :manage, @gear_list

    if GearListBuilder.create(@gear_list, gear_list_params, params[:items])
      flash[:notice] = "Created #{@gear_list.name}"
      redirect_to gear_list_path(@gear_list)
    else
      render :edit
    end
  end

  def edit
    @gear_list = current_user.gear_lists.friendly.find(params[:id])
    @items = draggable_items(current_user, @gear_list)

    authorize! :manage, @gear_list
  end

  def update
    @gear_list = current_user.gear_lists.friendly.find(params[:id])

    authorize! :manage, @gear_list

    if GearListBuilder.update(@gear_list, gear_list_params, params[:items])
      flash[:notice] = "Updated #{@gear_list.name}"
      redirect_to gear_list_path(@gear_list)
    else
      render :edit
    end
  end

  def destroy
    @gear_list = current_user.gear_lists.friendly.find(params[:id])

    authorize! :manage, @gear_list

    if @gear_list.delete
      flash[:notice] = "Deleted list '#{@gear_list.name}'"
      redirect_to root_path
    else
      flash[:error] = "Could not delete list '#{@gear_list.name}'"
      redirect_to gear_list_path(@gear_list)
    end
  end

  private

    def gear_list_params
      params.require(:gear_list).permit(:category_id, :name, :items, :quantities, :description, :blessed, :user_id)
    end

    def draggable_items(user, gear_list)
      users   = user.items.where(Item.arel_table[:id].not_in(gear_list.item_ids))
      blessed = Item.blessed.where(Item.arel_table[:id].not_in(gear_list.item_ids))

      (users | blessed).sort { |a, b| a.name <=> b.name }
    end
end
