class BookmarksController < ApplicationController
  before_action :find_list
  # before_action :find_movie, only: [:create]

  def new
    @bookmark = Bookmark.new
  end
  
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render "new"
    end
  end
  

private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
  
  def find_list
    @list = List.find(params[:list_id])
  end

end
