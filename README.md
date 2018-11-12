

## users_groups_relation_table
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false ,foreign_key:true|
|group_id|references|null: false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :group


## users_table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique:true, index: true|
|email|string|null: false, unique:true|
|password|string|null: false|

### Association
- has_many :groups, through: :users_groups_relations
- has_many :users_groups_relations
- has_many :messages


## groups_table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique:true|

### Association
- has_many :users through: :users_groups_relations
- has_many :users_groups_relations
- has_many :messages


## messages_table
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false ,foreign_key:true|
|group_id|references|null: false, foreign_key:true|
|text|text| |
|image|text| |

### Association
- belongs_to :user
- belongs_to :group
