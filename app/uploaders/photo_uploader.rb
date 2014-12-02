class PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "file/upload/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :big do
    process :rotate_it
    process resize_to_limit: [1024, 3000]
  end

  version :on_use do
    process :rotate_it
    process resize_to_fill: [250, 360]
  end

  version :thumb do
    process :rotate_it
    process resize_to_fill: [80, 80]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end  

  def rotate_it
    exif = MiniExiftool.new self.path
    if exif.orientation == "Rotate 90 CW"
      manipulate! do |img| 
        img.rotate "90"
        img
      end
    end
  end

end