# アプリケーション名
  NO ZAIKO NO LIFE

# アプリケーション概要
  製品情報・部品情報を管理し、製品の受注に合わせて在庫部品が減ってきた時に発注をアシストするためのアプリケーションです。

# URL
  https://no-zaiko-no-life.herokuapp.com/	


# テスト用アカウント
	ログイン機能等を実装した場合は、ログインに必要な情報を記述。またBasic認証等を設けている場合は、そのID/Passも記述すること。

# 利用方法	
  このアプリケーションの利用方法を記述。

# 目指した課題解決	
  ものづくりのにおいて、コスト削減・納期短縮を目的として標準部品を在庫として保管して置くことが多々あります。
  しかし、この在庫はただ多ければいいという訳ではありません。
  在庫数が多ければそれだけスペースを確保してしまうし、使わなかった場合には余剰コストにもなってしまします。
  そこで適正な数を在庫として管理する必要があります。
  そんな在庫管理をアシストをするのがこのアプリケーションです。
  適正な在庫数の管理をすることで部品の過不足をなくします。
  また在庫部品が減ってきた時に部品発注のアシストを行い、作業工程の削減も行ます。

# 洗い出した要件
- ユーザー管理機能
- 部品管理機能
- 製品管理機能
- 在庫数管理機能
- 部品必要数管理機能
- 部品発注機能
- 製品受注機能


# テーブル設計

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
| material    | string     | null: false                    |
| price       | integer    | null: false                    |
| supplier_id | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :parts_stock
- has_many :amount_of_necessary_part 

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
- has_many :amount_of_necessary_part 

## amount_of_necessary_part テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| count   | integer    | null: false                    | 
| part    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :part
- belongs_to :product