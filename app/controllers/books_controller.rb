class BooksController < ApplicationController
  get "/books" do
      erb  :"books/books"
  end

end
