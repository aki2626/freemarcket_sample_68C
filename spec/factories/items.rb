FactoryBot.define do
  factory :item do
    name                     {"test"}
    price                    {"300"}
    status_id                {"2"}
    brand                    {"シャネル"}
    shipping_fee_id          {"2"}
    shipping_method_id       {"3"}
    owners_area_id           {"3"}
    arrival_date_id          {"2"}
    explain                  {"これはいいテストです。"}
    a_category_id            {"2"}
    # a_categoryは後にcategoryに変更する
    user
    buyer_id                 {"1"}
  end
end
