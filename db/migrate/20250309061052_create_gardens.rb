class CreateGardens < ActiveRecord::Migration[7.2]
  def change
    create_table :gardens do |t|
      t.integer :assemblydist
      t.string :address
      t.string :borough
      t.integer :communityboard
      t.integer :congressionaldist
      t.integer :coundist
      t.string :gardenname
      t.string :juris
      t.string :multipolygon
      t.string :openhrsf
      t.string :openhrsm
      t.string :openhrssa
      t.string :openhrssu
      t.string :openhrsth
      t.string :openhrstu
      t.string :openhrsw
      t.string :parksid
      t.string :policeprecinct
      t.integer :statesenatedist
      t.string :status
      t.string :zipcode

      t.timestamps
    end
  end
end
