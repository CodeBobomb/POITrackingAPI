class PointOfInterestSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :date_added, :lat, :lng, :company_id

  def company_id
  	object.company.id
  end
end
