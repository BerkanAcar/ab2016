class AddOrderArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :order, :string
  end
end
