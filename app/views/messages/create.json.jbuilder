 json.user_name  @message.user.name
 json.created_at  @message.created_at.strftime('%Y年%m月%d日 %H:%M:%S')
 json.text  @message.text
 json.image @message.image
 json.imagePresent @message.image.present?
 json.textPresent @message.text.present?

