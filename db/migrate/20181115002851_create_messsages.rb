class CreateMesssages < ActiveRecord::Migration[5.0]
  def change
    create_table :messsages do |t|
      t.references  :user, foreign_key: true
      t.references  :group, foreign_key: true
      t.text        :text
      t.text       :image
      t.timestamps
    end
  end
end
