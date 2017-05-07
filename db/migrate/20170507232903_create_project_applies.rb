class CreateProjectApplies < ActiveRecord::Migration[5.0]
  def change
    create_table :project_applies do |t|
      t.text :description
      t.references :user, index: true
      t.references :project, index: true
      t.timestamps
    end
  end
end
