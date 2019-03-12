class AddFeedbackTable < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.string :user_name
      t.string :comments
      t.timestamps
    end
  end
end
