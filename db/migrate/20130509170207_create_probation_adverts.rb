class CreateProbationAdverts < ActiveRecord::Migration
  def change
    create_table :probation_adverts do |t|
      t.string :sayi, :null => false

      t.timestamps
    end
  end
end
