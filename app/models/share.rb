class Share < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

belongs_to_active_hash :prefecture
belongs_to_active_hash :human

delegate :name, to: :prefecture
belongs_to :user
mount_uploader :image, ImageUploader

end
