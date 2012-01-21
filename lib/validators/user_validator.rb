class UserValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:zipcode] << 'Zipcode is required.' if record.zipcode.blank?
    unless record.new_record?
      
    end
  end
end
