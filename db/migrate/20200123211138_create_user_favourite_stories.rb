class CreateUserFavouriteStories < ActiveRecord::Migration[5.2]
  def change
    create_table :user_favourite_stories do |t|
      t.references :user, foreign_key: true
      t.references :story, foreign_key: true

      t.timestamps
    end
  end
end
