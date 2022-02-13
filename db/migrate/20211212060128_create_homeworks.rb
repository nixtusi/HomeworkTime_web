class CreateHomeworks < ActiveRecord::Migration[6.1]
  def change
     create_table :homeworks do |t|
      t.string :homework_name
      t.string :homework_range
      t.date :homework_deadline
    end
  end
end
