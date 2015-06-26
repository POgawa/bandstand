class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues
  validates :name, :presence => true
  validates_uniqueness_of :name
  before_save :capitalize_band_name


  def add_venues |venue_ids|
    venue_ids.each do |venue_id|
      self.venues << Venue.find venue_id.to_i
    end
  end


  private

  def capitalize_band_name
    self.name[0]= name[0].capitalize
  end

end
