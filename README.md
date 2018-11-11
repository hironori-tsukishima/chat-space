# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## users_table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique:true|
|password|integer|null: false, unique:true|
|timestamp|timestamp|null: false|

### Association
- has_many :groups through users_groups_relations
- has_many :users_groups_relations

## groups_table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique:true|
|timestamp|timestamp|null: false|

### Association
- has_many :users through users_groups_relations
- has_many :users_groups_relations


## users_groups_relation_table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false ,foreign_key:true|
|group_id|integer|null: false, foreign_key:true|
|timestamp|timestamp|null: false|

belongs_to :user
belongs_to :group


## messages_table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false ,foreign_key:true|
|group_id|integer|null: false, foreign_key:true|
|text|text|null: false|
|image|text| |
|timestamp|timestamp|null: false|

belongs_to :user
belongs_to :group


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
