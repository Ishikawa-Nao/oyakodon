class Like < ApplicationRecord
  belongs_to :world
  belongs_to :user

  validates_uniqueness_of :world_id, scope: :user_id

end
