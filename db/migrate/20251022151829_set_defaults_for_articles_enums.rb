class SetDefaultsForArticlesEnums < ActiveRecord::Migration[7.0] 
  def change
    change_column_default :articles, :kind, from: nil, to: 0           # article
    change_column_default :articles, :category, from: nil, to: 0       # breakdowns
    change_column_default :articles, :status, from: nil, to: 0         # draft

  end
end