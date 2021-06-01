# アプリケーション名
  NO ZAIKO NO LIFE

# アプリケーション概要
  部品の在庫情報を管理し、登録情報を元に部品発注をアシストするためのアプリケーションです。

# URL
  https://no-zaiko-no-life.herokuapp.com/	


# テスト用アカウント
	ログイン用アドレス：tanaka@com
  パスワード　　　　：aaa111

# 利用方法	
  注文書を作成し、部品の発注をアシストすることを主な機能としたアプリケーションです。
  ユーザー登録を行うことで、部品・製品の登録が可能となります。
  登録した部品には追加で在庫情報の登録が可能になります。
  在庫情報を登録すると、部品情報とその在庫情報に基づき注文書を作成する事が可能になります。

# 目指した課題解決	
  ものづくりのにおいて、コスト削減・納期短縮を目的として標準部品を在庫として保管して置くことが多々あります。
  しかし、この在庫はただ多ければいいという訳ではありません。
  在庫数が多ければそれだけスペースを確保してしまうし、使わなかった場合には余剰コストにもなってしまします。
  そこで適正な数を在庫として管理する必要があります。
  そんな在庫管理をアシストをするのがこのアプリケーションです。
  適正な在庫数の管理をすることで部品の過不足をなくします。
  また在庫部品が減ってきた時に部品発注のアシストを行い、作業工程の削減も行ます。
  また登録した部品の情報を活用し、発注までの作業を効率化する事が可能です。

# 洗い出した要件
- ユーザー管理機能
- 部品管理機能
- 製品管理機能
- 在庫数管理機能
- 部品発注機能
- 部品必要数管理機能（作成中）
- 製品受注機能（作成中）

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