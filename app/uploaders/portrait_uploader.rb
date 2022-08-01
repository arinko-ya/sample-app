class PortraitUploader < CarrierWave::Uploader::Base
  def cache_dir
    "uploads/users/portraits/#{model.id}/tmp/cache"
  end

  def store_dir
    "uploads/users/portraits/#{model.id}/"
  end

  def extension_whitelist
    %w[png PNG jpg JPG jpeg JPEG svg SVG]
  end
end