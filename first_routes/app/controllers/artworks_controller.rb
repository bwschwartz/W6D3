class ArtworksController < ApplicationController

  def create
    new_artwork = Artwork.new(artwork_params)
    if new_artwork.save
      render json: new_artwork
    else
      render json: new_artwork.errors_full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find(params[:id]) #security ?
    artwork.destroy
    render json: artwork
  end

  def index
    # @artworks = Artwork.all
    # render json: @artworks
    @artworks = Artwork.artworks_for_user_id(params[:user_id])
    render json: @artworks
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    if !artwork_params.empty?
      artwork.update(user_params)
    else
      render plain: "fucks"
    end
  end


  private
  def artwork_params
    params.require(:artwork).permit(:title, :artist_id, :image_url)
  end
end