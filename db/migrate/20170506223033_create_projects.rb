class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :company_name
      t.string :title, max: 255
      t.text :description
      t.string :category, max: 128
      t.date :start_date
      t.date :end_date
      t.references :user, index: true
      t.timestamps
    end
  end
end
