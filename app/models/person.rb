class Person < ActiveRecord::Base

  validate :name_title_combinations

  private

  def name_title_combinations
    error_string = "You must enter title / last name, or first / last name"

    if title.blank?
      if first_name.blank? || last_name.blank?
        errors[:base] << error_string
      end
    else
      if last_name.blank?
        errors[:base] << error_string
      end
    end
  end
end