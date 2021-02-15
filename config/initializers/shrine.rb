require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"

if Rails.env.production?
  s3_options = {
    bucket: Rails.application.credentials.dig(:s3, :bucket_name), # required 
    region: "ap-northeast-1", 
    access_key_id: Rails.application.credentials.dig(:s3, :access_key_id),
    secret_access_key: Rails.application.credentials.dig(:s3, :secret_access_key)
  }
  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options), # temporary
    store: Shrine::Storage::S3.new(prefix: 'store', **s3_options)  # permanent
  }

else
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store")  # permanent
  }
end

Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files
Shrine.plugin :determine_mime_type    # determine and store the actual MIME type of the file analyzed from file content.
