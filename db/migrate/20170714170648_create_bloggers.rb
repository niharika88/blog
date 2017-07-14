class CreateBloggers < ActiveRecord::Migration
  def change
    create_table :bloggers do |t|
      t.string :title
      t.string :author

      t.timestamps null: false
    end
  end
end
