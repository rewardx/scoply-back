class CreateRepositories < ActiveRecord::Migration[5.1]
  def change
    create_table :repositories do |t|
      t.string :owner
      t.string :code
      t.string :url
      t.belongs_to :company, index: true, null: false
    end
  end
end
