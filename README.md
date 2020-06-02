# DB設計 chat-space

## usersテーブル
| Column | Type | Options |
|--------|------|---------|
| name | string | null: false, index: true |
| email | string | null: false |
| password | string | null: false |

### Association
- has_many :groups_users
- has_many :groups, through: :groups_users
- has_many :messages

## groups_usersテーブル <!-- 中間テーブル -->
| Column | Type | Options |
|--------|------|-------- |
| user_id | references | null: false, foreign_key: true |
| group_id | references | null: false, foreign_key: true |

### Association
- belongs_to :group
- belongs_to :user

## groupsテーブル
| Column | Type | Options |
|--------|------|---------|
| name | string | null: false |

### Association
has_many :users, through: :groups_users
has_many :massages
has_many :groups_users

## messagesテーブル
| Column | Type | Options |
|--------|------|---------|
| text | text |
| image | string |
| user_id | references | null: false, foreign_key: true |
| group_id | references | null: false, foreign_key: true |

### Association
- belongs_to :group
- belong_to :user