# README

## users
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| nickname   | string | null: false, unique: true |
| email      | string | null: false, unique: true |
| password   | string | null: false, unique: true |
| family_name   | string | null: false |
| first_name    | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birthday   | integer | null: false |

### Association
- has_many :items
- has_many :comments
- has_one :buyers


## items
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item_name        | string | null: false |
| category_id      | string | null: false |
| note             | text | null: false |
| condition_id     | integer | null: false |
| delivery_fee_id  | integer | null: false |
| delivery_area_id | string | null: false |
| days_id          | integer | null: false |
| price            | integer | null: false |

### Association
- belongs_to :users
- has_one :buyers
- has_many :comments


## comment
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| items    | string | null: false |
| comments | string | null: false |

### Association
- belongs_to :users
- belongs_to :items


# buyers
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true 
| post_code     | string | null: false |
| prefecture    | string | null: false |
| city          | string | null: false |
| block         | string | null: false |
| building      | string |  |
| phone_nimber  | string | null: false |

### Association
- belongs_to :users
- belongs_to :items