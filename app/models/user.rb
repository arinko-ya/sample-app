class User < ApplicationRecord
  mount_uploader :portrait, PortraitUploader
end