# README

## users
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| nickname   | string | null: false |
| email      | string | null: false, unique: true |
| encrypted_password  | string | null: false |
| family_name   | string | null: false |
| first_name    | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birthday   | date | null: false |

### Association
- has_many :items
- has_many :orders


## items
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item_name        | string | null: false |
| category_id      | integer | null: false |
| note             | text | null: false |
| condition_id     | integer | null: false |
| delivery_fee_id  | integer | null: false |
| delivery_area_id | integer | null: false |
| shipping_day_id          | integer | null: false |
| price            | integer | null: false |

### Association
- belongs_to :user
- has_one :buyer


## orders
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item    | string | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has one :buyer


# buyers
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true 
| post_code     | string | null: false |
| prefecture_id    | integer | null: false |
| city          | string | null: false |
| block         | string | null: false |
| building      | string |  |
| phone_nimber  | string | null: false |

### Association
- belongs_to :order

