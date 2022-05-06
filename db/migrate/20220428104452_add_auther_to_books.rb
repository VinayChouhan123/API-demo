class AddAutherToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :auther 
  end
end
