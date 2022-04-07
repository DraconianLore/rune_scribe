class AddDemoUser < ActiveRecord::Migration[6.1]
  def change
    User.create(email: 'draclore1@outlook.com', password: 'test', character: 'Demo Character', level: 10, house: 'Life', theme: 'Life', follower: 'Lord')
  end
end
