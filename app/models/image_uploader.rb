class ImageUploader < Shrine
	plugin :validation_helpers

  Attacher.validate do
    validate_max_size 15 * 1024 * 1024, message: 'ファイルサイズは15MBまでです' 
  end
end
