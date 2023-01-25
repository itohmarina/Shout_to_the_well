class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @groups = Group.all.where(is_deleted: true)
  end
  
  def update
    @group = Group.find(params[:id])
    if @group.is_deleted == false
      @group.update(is_deleted: true)
      redirect_to request.referer
    else
      @group.update(is_deleted: false)
      redirect_to request.referer
    end
  end

end
