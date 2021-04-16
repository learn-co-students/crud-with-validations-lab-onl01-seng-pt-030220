class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

# RSpec.describe SongsController, type: :controller do
#   let(:valid_attributes) do
#     {
#       title: "Talisman",
#       artist_name: "Air",
#       release_year: 2007,
#       released: true,
#       genre: "Post-Rock"
#     }
#   end

