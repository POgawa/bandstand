class Venue < ActiveRecord::Base
  has_and_belongs_to_many :bands
  validates:name, {:presence => true}
  validates_uniqueness_of:name, {:case_sensitive => false}
  before_save:capitalize_venue_name


  default_scope {order'name'}


  private

  def capitalize_venue_name
    self.name[0]=name[0].capitalize
  end

end
