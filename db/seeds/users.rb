5.times do
  user = User.create(
    username: Faker::Games::LeagueOfLegends.champion,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end