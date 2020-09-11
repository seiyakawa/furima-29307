<!-- # README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->

# テーブル設計

## users テーブル

| Column            | Type     | Options     |
| ----------------- | -------- | ----------- |
| nickname          | string   | null: false |
| email             | string   | null: false |
| password          | string   | null: false |
| family_name_kanzi | string   | null: false |
| first_name_kanzi  | string   | null: false |
| family_name_kana  | string   | null: false |
| first_name_kana   | string   | null: false |
| birthday          | integer  | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type      | Option                        |
| --------------- | --------- | ----------------------------- |
| image           | text      | null: false                   |
| name            | string    | null: false                   |
| category        | string    | null: false                   |
| status          | string    | null: false                   |
| shipping_burden | string    | null: false                   |
| shipping_area   | string    | null: false                   |
| shipping_day    | integer   | null: false                   |
| price           | integer   | null: false                   |
| user_id         | reference | null: false, foreign_key:true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column          | Type      | Options                       |
| --------------- | --------  | ----------------------------- |
| card_number     | integer   | null: false                   |
| expiration_date | integer   | null: false                   |
| security_number | integer   | null: false                   |
| post_number     | integer   | null: false                   |
| prefecture      | string    | null: false                   |
| city            | string    | null: false                   |
| address         | string    | null: false                   |
| building        | string    | null: false                   |
| phone_number    | integer   | null: false                   |
| user_id         | reference | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :order