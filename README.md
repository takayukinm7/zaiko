## users テーブル

| Column | Type    | Options                   |
| ------ | ------- | ------------------------- |
| name   | string  | null: false               |
| email  | string  | null: false, unique: true |
| number | integer | null: false, unique: true |

### Association

- has_many :parts
- has_many :products

## parts テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| number      | string     | null: false, unique: true      |
| category_id | integer    | null: false                    |
| material    | string     |                                |
| price       | integer    |                                |
| supplier_id | integer    |                                |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :parts_count
- has_many :part_product

## parts_stock テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| still_extant | integer    | null: false                    |
| lot          | integer    | null: false                    |
| buy_point    | integer    | null: false                    |
| part         | references | null: false, foreign_key: true |

### Association

- belongs_to :part

## products テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :part_product

## amount_of_necessary_part テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| count   | integer    | null: false                    | 
| part    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :part
- belongs_to :product