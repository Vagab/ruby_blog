class FillExistingRecordsSlug < ActiveRecord::Migration[5.2]
  def up
    Article.all.each do |a|
      a.update_columns(
        slug: a.title.parameterize.concat("-#{Time.now.strftime('%d-%m-%Y')}")
      )
    end
  end

  def down
    puts "nothing to do"
  end
end
