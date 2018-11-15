class Group < ApplicationRecord

  has_many :users , through: :users_groups_relations
  has_many :users_groups_relations
  has_many :messages

  def showLastMessage
    if (content = messages.last).present?
      if content.text?
        content.text
      else
        "画像が送信されています"
      end
    else
      "まだメッセージはありません"
    end
  end
end
