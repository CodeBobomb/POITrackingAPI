class AddCompanyToPointOfInterests < ActiveRecord::Migration
  def change
    add_column :point_of_interests, :company_id, :integer
  end
end
