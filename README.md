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

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| family_name_kanzi | string | null: false |
| first_name_kanzi  | string | null: false |
| family_name_kana  | string | null: false |
| first_name_kana   | string | null: false |
| birthday          | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Option                        |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null: false                   |
| text               | text     | null: false                   |
| category_id        | integer    | null: false                   |
| status_id          | integer    | null: false                   |
| shipping_burden_id | integer    | null: false                   |
| shipping_area_id   | integer    | null: false                   |
| shipping_day_id    | integer    | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| user    | references | null: false, foreign_key:true |
| item    | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| post_number   | string     | null: false                   |
| prefecture_id | integer    | null: false                   |
| city          | string     | null: false                   |
| address       | string     | null: false                   |
| building      | string     |                               |
| phone_number  | string     | null: false                   |
| order         | references | null: false, foreign_key:true |

### Association

- belongs_to :order