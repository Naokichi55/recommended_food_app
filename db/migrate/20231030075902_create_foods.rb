# frozen_string_literal: true

class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false, comment: "料理名"
      t.text :comment, comment: "コメント"
      t.references :user, null: false, foreign_key: true, comment: "ユーザーID"

      t.timestamps
    end
  end
end
