class WelcomeController < ApplicationController

   def index
    location = Array.new
    @trees = Tree.all
    @location = Location.new
    @json = @trees.each.to_gmaps4rails do |tree, marker|
      location_link = view_context.link_to "#{tree.name}", tree_path(tree)
      marker.infowindow "<h4><u>#{location_link}</u></h4>
                         <i>#{tree.location}</i><br>
                         <img src='#{tree.pictures.first[:url]}'
                         style='max-height: 50px; max-width: 50px;'/>"
    end
  end

  def create
    @location = Location.create(:location => params[:location])
    render :location
  end




end