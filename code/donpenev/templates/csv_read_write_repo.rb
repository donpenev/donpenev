def save_to_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(filepath_to_csv, 'wb', csv_options) do |csv|
      @recipes.each do |rec|
        csv << [rec.name, rec.description]
      end
    end
  end

  def load_csv
    CSV.foreach(filepath_to_csv, @csv_options) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end
end
