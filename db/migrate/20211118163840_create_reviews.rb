class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :group
      t.text :content

      t.timestamps
    end
  end
end
