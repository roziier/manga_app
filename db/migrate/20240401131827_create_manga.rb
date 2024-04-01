class CreateManga < ActiveRecord::Migration[7.1]
  def change
    create_table :mangas do |t|
      t.string :title
      t.string :mangaka
      t.string :collected
      t.string :status

      t.timestamps
    end
  end
end
