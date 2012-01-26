class UserValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:base, 'Zipcode is required.') if record.new_record? and record.zipcode_tmp.blank?
  end
end
