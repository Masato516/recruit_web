class ImageUploader < Shrine
	plugin :validation_helpers

  Attacher.validate do
    validate_max_size 5 * 1024 * 1024, message: 'ファイルサイズは5MBまでです' 
  end
end
