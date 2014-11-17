class CreateQuantifiers < ActiveRecord::Migration
  def change
    create_table :quantifiers do |t|
      t.string :text

      t.timestamps
    end
  end
end
