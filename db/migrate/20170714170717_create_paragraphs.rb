class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.text :data
      t.references :blogger, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
