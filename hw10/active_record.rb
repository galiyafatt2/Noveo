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
      t.string :username, null: false
      t.timestamps
    end
  end
end

class CreatePodcastTable < ActiveRecord::Migration[7.0]
  def change
    create_table :podcasts do |t|
      t.string :name, null: false
      t.string :topic, null: false
      t.timestamps
    end
  end
end

class CreateNewspaperTable < ActiveRecord::Migration[7.0]
  def change
    create_table :newspapers do |t|
      t.string :name, null: false
      t.string :topic, null: false
    end
  end
end

class CreateSubscriptionTable < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false
      t.references :subscribe, polymorphic: true, null: false
      t.timestamps
    end
  end
end

CreateUserTable.migrate(:change)
CreatePodcastTable.migrate(:change)
CreateNewspaperTable.migrate(:change)
CreateSubscriptionTable.migrate(:change)

class User < ActiveRecord::Base
  has_many :subscriptions, foreign_key: 'id_user', class_name: 'Subscription'
  has_many :podcasts, source: :subscribe, through: :subscriptions, source_type: 'Podcast', class_name: 'Podcast'
  has_many :newspapers, source: :subscribe, through: :subscriptions, source_type: 'Newspaper', class_name: 'Newspaper'
  validates :username, presence: true, uniqueness: true
end

class Podcast < ActiveRecord::Base
  has_many :subscriptions, as: :subscribe
  has_many :users, source: :user, foreign_key: 'id_user', through: :subscriptions, class_name: 'User'
  validates :name, presence: true, uniqueness: true
end

class Podcast < ActiveRecord::Base
  has_many :subscriptions, as: :subscribe
  has_many :users, source: :user, foreign_key: 'id_user', through: :subscriptions, class_name: 'User'
  validates :name, presence: true, uniqueness: true
end

class Newspaper < ActiveRecord::Base
  has_many :subscriptions, as: :subscribe
  has_many :users, source: :user, foreign_key: 'id_user', through: :subscriptions, class_name: 'User'
  validates :name, presence: true, uniqueness: true
end

class Subscription < ActiveRecord::Base
  has_many :podcasts, as: :subscribe
  has_many :newspapers, as: :subscribe
  belongs_to :user
  belongs_to :subscribe, polymorphic: true
end

User.new(username: 'Someone').save!
User.new(username: 'Someone else').save!

podcast = Podcast.new(name: 'How to not drive insane', topic: 'Psychology')
podcast.users << User.find_by(username: 'Someone')
podcast.save

podcast = Podcast.new(name: 'The music of my soul', topic: 'Music')
podcast.users << User.find_by(username: 'Someone else')
podcast.save

newspaper = Newspaper.new(name: 'Cats', topic: 'Animals')
newspaper.users << User.find_by(username: 'Someone')
newspaper.users << User.find_by(username: 'Someone else')
newspaper.save
