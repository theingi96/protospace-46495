class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text       :content,    null: false    # Comment စာသားအတွက်
      t.references :user,       null: false, foreign_key: true # ဘယ်သူပေးတာလဲ
      t.references :prototype,  null: false, foreign_key: true # ဘယ် Project မှာပေးတာလဲ
      t.timestamps
    end
  end
end