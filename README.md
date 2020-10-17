# README

# README

##  usersテーブル

| column          | Type    | options     | 
| --------------- | ------  | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| prefecture_id   | integer | null: false |

### Association
 has_many :articles
 has_many :favorites
 has_many :articles, through: :favorites
 has_many :comments


## articlesテーブル

| column        | Type       | options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| date          | date       | null: false                    |
| time_zone_id  | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| category_id   | integer    | null: false                    |
| text          | text       |                                |
| address       | string     |                                |
| latitude      | float      |                                |
| longitude     | float      |                                |
| parking       | float      |                                |
| crowd         | float      |                                |
| toilet        | float      |                                |
| hashbody      | string     |                                |
| user          | references | null: false, foreign_key: true |

### Association
 belongs_to :user
 has_many   :favorites
 has_many :users, through: :favorites
 has_many   :comments
 has_many   :article_hashes
 has_many   :hashtags, through: :article_hashes


  ## comments テーブル

| column  | Type       | options                        |
| ------- | ---------  | ------------------------------ |
| message | text       | null: false                    |
| article | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association
 belongs_to :user
 belongs_to :article

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
 has_many :articles, through: :article_hashes

## article_hashes テーブル

| column  | Type       | options                        |
| ------- | ---------  | ------------------------------ |
| article | references | null: false, foreign_key: true |
| hashtag | references | null: false, foreign_key: true |

### Association
 belongs_to :article
 belongs_to :hashtag

