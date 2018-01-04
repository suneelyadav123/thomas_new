class Order < ApplicationRecord

  belongs_to :user
  
  def self.import(file)
    rows_count = 0
    CSV.foreach(file.path, headers: true) do |row|
      Order.create! row.to_hash
      rows_count = rows_count + 1
    end
    rows_count 
  end
end
