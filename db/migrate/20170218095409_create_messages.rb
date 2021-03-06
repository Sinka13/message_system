class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :description
      t.boolean :is_new, default: true
      t.references :user, foreign_key: true
      t.references :chat, foreign_key: true

      t.timestamps
    end
  end
end
