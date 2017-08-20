class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    List.create(list_params)
    redirect_to root_path
  end

  def edit
    @list = List.find(params[:id])
  end

  def show
    @list = List.find(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
