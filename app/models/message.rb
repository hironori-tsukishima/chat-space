class Message < ApplicationRecord
  belongs_to :used
  belongs_to :group
  mount_uploader :image, ImageUploader
  validates :text || :image ,presence: true
end
