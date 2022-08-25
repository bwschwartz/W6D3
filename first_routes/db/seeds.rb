# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.delete_all

Artwork.delete_all

ArtworkShare.delete_all

User.create!([
  {username: "Ben"},
  {username: "Fred"},
  {username:"Ronny"}
])

Artwork.create!([
  {title: "bens painting", image_url:'https://cdn.pixabay.com/photo/2017/08/30/12/45/girl-2696947__480.jpg', artist_id: User.find_by("username = 'Ben'").id},
  {title: "freds painting", image_url: "https://admin.itsnicethat.com/images/jATCQ-js_FRTMfP5F4_-cv0CTzA=/228090/format-webp%7Cwidth-1440/glastonbury_bins_charlie_sheppard_rosanna_webster_art_itsnicethat.jpg",  artist_id: User.find_by("username = 'Fred'").id},
  {title: "ronnys painting", image_url: "https://admin.itsnicethat.com/images/jATCQ-js_FRTMfP5F4_-cv0CTzA=/228090/format-webp%7Cwidth-1440/glastonbury_bins_charlie_sheppard_rosanna_webster_art_itsnicethat.jpg",  artist_id: User.find_by("username = 'Ronny'").id}
])

ArtworkShare.create!([
  {artwork_id: Artwork.find_by("title = 'bens painting'").id, viewer_id: User.find_by("username = 'Fred'").id},
  {artwork_id: Artwork.find_by("title = 'ronnys painting'").id, viewer_id: User.find_by("username = 'Ben'").id}
])



