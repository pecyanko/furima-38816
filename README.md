#テーブル設計


##usersテーブル

| Column          | Type   | Options                        |
| --------------- | ------ | ------------------------------ |
| nick_name       | string | null: false, foreign_key: true |
| email           | string | null: false, foreign_key: true |
| password        | string | null: false, foreign_key: true |
| first_name      | string | null: false, foreign_key: true |
| last_name       | string | null: false, foreign_key: true |
| first_name_kana | string | null: false, foreign_key: true |
| first_name_kana | string | null: false, foreign_key: true |
| birth_day       | int    | null: false, foreign_key: true |

###Association
- has_many :items
- has_many :orders
- has_one :address



##itemsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false, foreign_key: true |
| introduction | text       | null: false, foreign_key: true |
| category     | text       | null: false, foreign_key: true |
| condition    | text       | null: false, foreign_key: true |
| charge       | text       | null: false, foreign_key: true |
| address      | text       | null: false, foreign_key: true |
| delivery_day | int        | null: false, foreign_key: true |
| cost         | int        | null: false, foreign_key: true |
| user_id      | references | null: false, foreign_key: true |

###Association
- belongs_to :users
- has_one :orders



##addressテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | references | null: false, foreign_key: true |
| prefecture_id | references | null: false, foreign_key: true |
| city          | references | null: false, foreign_key: true |
| block         | references | null: false, foreign_key: true |
| building      | references | null: false, foreign_key: true |
| phone_number  | references | null: false, foreign_key: true |
| name          | references | null: false, foreign_key: true |
| name          | references | null: false, foreign_key: true |

###Association
- belongs_to :users


##
ordersテーブル]

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

###Association
- belongs_to :items
- belongs_to :users

