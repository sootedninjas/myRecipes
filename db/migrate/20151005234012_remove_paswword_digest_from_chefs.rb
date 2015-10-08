class RemovePaswwordDigestFromChefs < ActiveRecord::Migration
  def change
    remove_column :chefs, :paswword_digest, :string
  end
end
