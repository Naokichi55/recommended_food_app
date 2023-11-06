# frozen_string_literal: true

email = "test@example.com"
password = "password"
ActiveRecord::Base.connection.execute <<~SQL.squish
  TRUNCATE TABLE users RESTART IDENTITY CASCADE;
SQL

user1 = User.create!(email: "satou@example.com", password: "password")
user2 = User.create!(email: "suzuki@example.com", password: "password")
user3 = User.create!(email: "tanaka@example.com", password: "password")

user3.foods.create!(name: "ゴーヤチャンプル")
user2.foods.create!(name: "沖縄そば")
user1.foods.create!(name: "ゴーヤチャンプル")

User.create!(email:, password:)
puts "ユーザーの初期投入に成功しました。"
