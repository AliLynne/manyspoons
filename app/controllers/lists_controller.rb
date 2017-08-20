class ListsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :show, :destroy, :edit]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    current_user.lists.create(list_params)
    redirect_to root_path
  end

  def edit
    @list = List.find(params[:id])
    if @list.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update_attributes(list_params)
    redirect_to root_path
  end

  def destroy
    @list = List.find(params[:id])
    if @list.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    
    @list.destroy
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
