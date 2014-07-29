class Person < ActiveRecord::Base

  has_many :assignments

  validate :name_title_combinations

  def unique_locations
    Assignment.where(person_id: self.id).pluck(:location_id).uniq.count
  end

  private

  def name_title_combinations
    error_string = "You must enter title / last name, or first / last name"

    if title.blank?
      if first_name.blank? || last_name.blank?
        errors.add(:base, error_string)
      end
    else
      if last_name.blank?
        errors.add(:base, error_string)
      end
    end
  end
end