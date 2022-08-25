class ArtworkSharesController < ApplicationController
  def create
    new_artwork_share = ArtworkShare.new(share_params)

    if new_artwork_share.save
      render json: new_artwork_share
    else
      render json: new_artwork_share.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork_share = ArtworkShare.find(params[:id])
    artwork_share.destroy

    render json: artwork_share
  end


  def share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end


end
