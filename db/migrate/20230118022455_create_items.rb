class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name              , null: false
      t.text       :introduction      , null: false
      t.integer    :category_id       , null: false
      t.integer    :condition_id      , null: false
      t.integer    :charge_id         , null: false
      t.integer    :prefecture_id     , null: false
      t.integer    :delivery_day_id   , null: false
      t.integer    :cost              , null: false
      t.references :user              , null: false, foreign_Key: true

      t.timestamps
    end
  end
end
