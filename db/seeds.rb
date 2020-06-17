require "csv"

CSV.foreach("db/seeds/user.csv", headers: true) do |row|
  User.create!(
    email: row["email"],
    nickname: row["nickname"],
    first_name: row["first_name"],
    last_name: row["last_name"],
    first_name_kana: row["first_name_kana"],
    last_name_kana: row["last_name_kana"],
    birth_date: row["birth_date"],
    password: row["password"],
    reset_password_token: row["reset_password_token"],
    reset_password_sent_at: row["reset_password_sent_at"],
    remember_created_at: row["remember_created_at"]
  )
end

CSV.foreach("db/seeds/address.csv", headers: true) do |row|
  Address.create!(
    zipcode: row["zipcode"],
    owners_area_id: row["owners_area_id"],
    city_name: row["city_name"],
    city_number: row["city_number"],
    building_name: row["building_name"],
    phone_number: row["phone_number"],
    user_id: row["user_id"],
  )
end



# if Rails.env == "development"
  # (1..5).each do |i|
  #   User.create!(
  #     email: "#{i}@mail.com",
  #     nickname: "ユーザー#{i}",
  #     password: "#{i}",
  #     reset_password_token: "#{i}",
  #     reset_password_sent_at: "#{i}",
  #     remember_created_at: "#{i}"
  #   )
  # end
# end



# active_hashの方を利用
# CSV.foreach("db/seeds/category.csv", headers: true) do |row|
#   Category.create!(
#     name: row["name"]
#   )
# end




# item_imageはCarrierWaveでseedするため、CSV記法が使えない
# CSV.foreach("db/seeds/item_image.csv", headers: true) do |row|
#   ItemImage.create!(
#     image: row["image"],
#     item_id: row["item_id"]
#   )
# end







#直接記法#############################

# categoriesテーブル
  # Category.create!(
  #   name: "PCパーツ"
  # )
  # Category.create!(
  #   name: "子供服"
  # )




# # usersテーブル
# User.create!(
#   email: "t@p.com",
#   nickname: "Tamura1",
#   password: "a21se234"
# )



# # itemsテーブル
#   Item.create!(
#     name: "お肉",
#     price: "1000",
#     status: "中古",
#     brand: "",
#     shipping_fee: "",
#     shipping_method: "",
#     owners_area: "",
#     arrival_date: "",
#     explain: "",
#     category_id: "2",
#     user_id: "1",
#     buyer_id: "",
#     item_image_id: "1"
#   )
#   Item.create!(
#     name: "FireTV",
#     price: "4000",
#     status: "中古",
#     brand: "Amazon",
#     shipping_fee: "出品者負担",
#     shipping_method: "メルカリ便",
#     owners_area: "東京",
#     arrival_date: "1～2日で発送",
#     explain: "ここにい説明を書きます。ここにい説明を書きます。ここにい説明を書きます。ここにい説明を書きます。",
#     category_id: "1",
#     user_id: "1",
#     buyer_id: "2",
#     item_image_id: "2"
#   )



ItemImage.create!(
  image: open("#{Rails.root}/db/seeds/item_image/1.jpg"),
  item_id: "1"
)
ItemImage.create!(
  image: open("#{Rails.root}/db/seeds/item_image/2.jpg"),
  item_id: "1"
)
ItemImage.create!(
  image: open("#{Rails.root}/db/seeds/item_image/3.jpg"),
  item_id: "2"
)
ItemImage.create!(
  image: open("#{Rails.root}/db/seeds/item_image/4.jpg"),
  item_id: "1"
)
ItemImage.create!(
  image: open("#{Rails.root}/db/seeds/item_image/5.jpg"),
  item_id: "3"
)


CSV.foreach("db/seeds/item.csv", headers: true) do |row|
  image = open("#{Rails.root}/db/seeds/item_image/5.jpg")
  item = Item.create!(
    name: row["name"],
    price: row["price"],
    status_id: row["status_id"],
    brand: row["brand"],
    shipping_fee_id: row["shipping_fee_id"],
    shipping_method_id: row["shipping_method_id"],
    owners_area_id: row["owners_area_id"],
    arrival_date_id: row["arrival_date_id"],
    explain: row["explain"],
    category_id: row["category_id"],
    user_id: row["user_id"],
    buyer_id: row["buyer_id"],
    item_images_attributes: [image: image]
  )
end



