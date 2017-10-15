class MainController < ApplicationController
  def index
    @spotlight = Work.spotlight
    @top_movies = Work.top_10('movie')
    @top_books = Work.top_10('book')
    @top_albums = Work.top_10('album')
  end
end
