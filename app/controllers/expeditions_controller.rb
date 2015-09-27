class ExpeditionsController < ApplicationController

  before_filter :authenticate_user!

  def show
    @expedition = current_user.expeditions.friendly.find(params[:id])

    authorize! :manage, @expedition
  end

  def new
    @expedition = current_user.expeditions.new
    @gear_lists = draggable_gear_lists(current_user, @expedition)

    authorize! :manage, @expedition
  end

  def create
    @expedition = current_user.expeditions.new(expedition_params)

    authorize! :manage, @expedition

    if ExpeditionBuilder.create(@expedition, expedition_params, params['gear_lists'])
      flash[:notice] = "Created #{@expedition.name}"
      redirect_to @expedition
    else
      render :edit
    end
  end

  def edit
    @expedition = current_user.expeditions.friendly.find(params[:id])
    @gear_lists = draggable_gear_lists(current_user, @expedition)

    authorize! :manage, @expedition
  end

  def update
    @expedition = current_user.expeditions.friendly.find(params[:id])

    authorize! :manage, @expedition

    if ExpeditionBuilder.update(@expedition, expedition_params, params['gear_lists'])
      flash[:notice] = "Updated #{@expedition.name}"
      redirect_to expedition_path(@expedition)
    else
      render :edit
    end
  end

  private

    def expedition_params
      params.require(:expedition).permit(:name, :description, :blessed)
    end

    # Merges the blessed gear lists with the user's gear lists, and excludes any that
    # are already in the expedition
    #
    def draggable_gear_lists(user, expedition)
      users   = user.gear_lists.where(GearList.arel_table[:id].not_in(expedition.gear_list_ids))
      blessed = GearList.blessed.where(GearList.arel_table[:id].not_in(expedition.gear_list_ids))

      (users | blessed).sort { |a, b| a.name <=> b.name }
    end

end
