class PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "file/upload/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :on_use do
    process resize_to_fill: [250, 360]
  end

  version :thumb do
    process resize_to_fill: [80, 80]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end