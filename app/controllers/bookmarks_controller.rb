class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end
  

  def create

  end
  

private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
  




end
