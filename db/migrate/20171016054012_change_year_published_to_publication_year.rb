class ChangeYearPublishedToPublicationYear < ActiveRecord::Migration[5.1]
  def change
    rename_column :works, :year_published, :publication_year
  end
end
