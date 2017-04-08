class CreateHistory < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :term
      t.string :subject
      t.string :course
      t.string :section
      t.string :instructor
      t.integer :enrollment
      t.string :MSES
      t.string :DAE
      t.string :ANG
      t.string :DANG
      
      t.timestamps
    end
  end
end
