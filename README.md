# README


# Benchpress100 DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null:false|
|password|string|null:false|
|nickname|string|null:false|
### Association
- has_many :trainingSessions

## trainingSessionsテーブル
|Column|Type|Options|
|------|----|-------|
|date|date|null:false|
|kg|integer|null:false|
|rep|integer|null:false|
### Association
- belongs_to :user
