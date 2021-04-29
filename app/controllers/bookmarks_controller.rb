class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@bookmark.list_id)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find_by(movie_id: params[:movie_id], list_id: params[:list_id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list_id)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end

