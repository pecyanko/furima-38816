#テーブル設計


##usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nick_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

###Association
- has_many :items
- has_many :orders



##itemsテーブル

| Column          | Type          | Options                        |
| --------------- | ------------- | ------------------------------ |
| name            | string        | null: false                    |
| introduction    | text          | null: false                    |
| category_id     | integer       | null: false                    |
| condition_id    | integer       | null: false                    |
| charge_id       | integer       | null: false                    |
| prefecture_id   | integer       | null: false                    |
| delivery_day_id | integer       | null: false                    |
| cost            | integer       | null: false                    |
| user            | references    | null: false, foreign_key: true |

###Association
- belongs_to :user
- has_one :order



##addressesテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | integer    | null: false |
| prefecture_id | integer    | null: false |
| city          | text       | null: false |
| block         | text       | null: false |
| building      | text       |             |
| phone_number  | integer    | null: false |

###Association
- belongs_to :order


##
ordersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

###Association
- belongs_to :item
- belongs_to :user
- belongs_to :address

