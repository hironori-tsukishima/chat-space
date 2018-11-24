json.array! @users do |user|
  json.user_id  user.id
  json.user_name  user.name
  json.created_at  user.created_at.strftime('%Y年%m月%d日 %H:%M:%S')
  json.email  user.email
end
