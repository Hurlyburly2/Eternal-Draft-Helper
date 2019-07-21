class ChangeRatingFromIntToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :ratings, :rating, :decimal, :precision => 2
  end
end
