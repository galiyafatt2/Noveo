require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'localhost',
  username: 'galiya',
  password: 'galiya',
  database: 'galiya'
)

class CreateUserTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.timestamps
    end
  end
end

class UserActive < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :active, :boolean, default: true, null: false
  end
end

class CreatePodcastTable < ActiveRecord::Migration[7.0]
  def change
    create_table :podcasts do |t|
      t.string :name, null: false
      t.integer :topic, null: false
      t.timestamps
    end
  end
end

class CreateNewspaperTable < ActiveRecord::Migration[7.0]
  def change
    create_table :newspapers do |t|
      t.string :name, null: false
      t.integer :topic, null: false
    end
  end
end

class CreateSubscriptionTable < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.integer :id_user
      t.references :subscribe, polymorphic: true
      t.timestamps
    end
  end
end

class SubscriptionStatus < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :sub_status, :integer, default: 0, null: false
  end
end
CreateUserTable.migrate(:up)
UserActive.migrate(:up)
#CreatePodcastTable.migrate(:down)
CreatePodcastTable.migrate(:up)
#CreateNewspaperTable.migrate(:down)
CreateNewspaperTable.migrate(:up)
#CreateSubscriptionTable.migrate(:down)
CreateSubscriptionTable.migrate(:up)
#SubscriptionStatus.migrate(:down)
SubscriptionStatus.migrate(:up)

class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :podcasts, source: :subscribe, through: :subscriptions
  has_many :newspapers, source: :subscribe, through: :subscriptions
  validates :username, presence: true, uniqueness: true
end

class Podcast < ActiveRecord::Base
  has_many :subscriptions, as: :subscribe
  has_many :users, source: :user, foreign_key: 'id_user', through: :subscriptions
  validates :name, presence: true, uniqueness: true
  enum topic: %i[music art animals]
end

class Newspaper < ActiveRecord::Base
  has_many :subscriptions, as: :subscribe
  has_many :users, source: :user, foreign_key: 'id_user', through: :subscriptions
  validates :name, presence: true, uniqueness: true
  enum topic: %i[music art animals]
end

class Subscription < ActiveRecord::Base
  belongs_to :user, foreign_key: 'id_user'
  belongs_to :subscribe, polymorphic: true
  enum sub_status: %i[active disabled]
end

User.new(username: 'Someone').save!
User.new(username: 'Someone else').save!

podcast = Podcast.new(name: 'How to not drive insane', topic: 0)
podcast.users << User.find_by(username: 'Someone')
podcast.save

podcast1 = Podcast.new(name: 'The music of my soul', topic: 1)
podcast1.users << User.find_by(username: 'Someone else')
podcast1.save

newspaper = Newspaper.new(name: 'Cats', topic: 2)
newspaper.users << User.find_by(username: 'Someone')
newspaper.users << User.find_by(username: 'Someone else')
newspaper.save

p Newspaper.first.as_json

User.first.update active: false
p User.first.as_json
User.first.update active: true
p User.first.as_json

