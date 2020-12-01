class CreateSalons < ActiveRecord::Migration[6.0]
  def change
    create_table :salons do |t|
      t.text :name
      t.text :address
      t.string :phone
      t.text :comment
      t.boolean :tokio
      t.boolean :ie
      t.boolean :design
      t.boolean :straight

      t.timestamps
    end
  end
end
