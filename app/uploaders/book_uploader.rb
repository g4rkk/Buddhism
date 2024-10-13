class BookUploader < CarrierWave::Uploader::Base
  # 这里你可以定义存储方式，例如 file 或 fog
  storage :file

  # 指定文件保存的路径
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # 限制允许上传的文件类型
  def extension_whitelist
    %w(pdf equb mobi)
  end
end
