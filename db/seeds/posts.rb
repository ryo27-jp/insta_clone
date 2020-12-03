User.limit(10).each do |user|
  post = user.posts.create(
    body: Faker::Games::LeagueOfLegends.quote,
    remote_images_urls: %w[https://picsum.photos/350/350/?random https://picsum.photos/350/350/?random]
  )
end