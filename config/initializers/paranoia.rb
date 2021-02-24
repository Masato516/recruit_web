# ユーザー退会後の論理削除・一意制約を両立させるための処理
# 非削除レコードはdeleted_at = '0000-01-01 00:00:00'
# 削除済みレコードはdeleted_at != '0000-01-01 00:00:00'
Paranoia.default_sentinel_value = Time.new(0)