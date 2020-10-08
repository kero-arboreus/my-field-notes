# README

# README

##  usersテーブル

| column          | Type    | options     | 
| --------------- | ------  | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |

### Association
 has_many :articles
 has_many :favorites
 has_many :comments


## articlesテーブル

| column        | Type       | options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| date          | date       | null: false                    |
| time_id       | integer    |                                |
| prefecture_id | integer    | null: false                    |
| category_id   | integer    | null: false                    |
| text          | text       | null: false                    |
| address       | string     |                                |
| latitude      | float      |                                |
| longitude     | float      |                                |
| parking       | float      |                                |
| crowd         | float      |                                |
| toilet        | float      |                                |
| user          | references | null: false, foreign_key: true |

### Association
 belongs_to :user
 has_many   :favorites
 has_many   :comments
 has_many   :article_hashes


  ## comments テーブル

| column | Type       | options                        |
| -------| ---------  | ------------------------------ |
| text   | text       | null: false                    |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
 belongs_to :user
 belongs_to :item

   ## favorites テーブル

| column  | Type       | options                        |
| ------- | ---------  | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| article | references | null: false, foreign_key: true |

### Association
 belongs_to :user
 belongs_to :article

## hashtags テーブル

| column   | Type   | options                        |
| -------- | ------ | ------------------------------ |
| hashname | string | null: false                    |

### Association
 has_many :article_hashes

## article_hashes テーブル

| column  | Type       | options                        |
| ------- | ---------  | ------------------------------ |
| article | references | null: false, foreign_key: true |
| hashtag | references | null: false, foreign_key: true |

### Association
 belongs_to :article
 belongs_to :hashtag

