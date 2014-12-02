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

  version :on_use, :from_version => :big do
    process resize_to_fill: [270, 390]
  end

  version :thumb, :from_version => :big do
    process resize_to_fill: [80, 80]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end  

  def rotate_it
    exif = MiniExiftool.new self.path
    if exif.orientation == "Rotate 90 CW"
      exif.orientation = 'Horizontal (normal)'
      exif.save
      manipulate! do |img| 
        img.rotate "90"
        img
      end
    elsif exif.orientation == "Rotate 270 CW"
      exif.orientation = 'Horizontal (normal)'
      exif.save
      manipulate! do |img| 
        img.rotate "-90"
        img
      end
    end
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

end