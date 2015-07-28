class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :user_move
      t.string :computer_move
      t.integer :user_wins
      t.integer :computer_wins
      t.integer :tie

      t.timestamps null: false
    end
  end
end
