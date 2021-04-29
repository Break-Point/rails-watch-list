class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy] 
  before_action :all_list, only: [:index, :new, :create, :destroy] 

  def index
    @list = List.new
  end

  def show
    @bookmark = Bookmark.new
    @movies = Movie.all
    @bookmark.list_id = @list.id
  end

  def new; end

  def create
    @list = List.create(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :index
    end
  end

  def edit; end
  
  def update
    @list.update(list_params)
    if @list.save
      render :show
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def all_list
    @lists = List.all
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
