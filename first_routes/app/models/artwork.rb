# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
  validates :title, uniqueness: {scope: :artist_id}

  def self.artworks_for_user_id(id)
    Artwork.joins(:shared_artworks)
    .where("artist_id = #{id}
      OR
      users.id = #{id}
      ")
  end


  belongs_to(
    :artist,
    class_name: :User,
    foreign_key: :artist_id
  )

  has_many(
    :shares,
    class_name: :ArtworkShare,
    foreign_key: :artwork_id,
    dependent: :destroy
  )

  has_many :shared_artworks, through: :shares, source: :viewer
end
