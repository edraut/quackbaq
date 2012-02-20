class UserValidator < ActiveModel::Validator
  def validate(record)
    if record.step_one?
      record.errors.add(:login, 'Username is required.') if record.login.blank?
      record.errors.add(:login, 'That username is taken, please try another.') if User.where("login = :login and id != :id",{:login => record.login, :id => record.id}).present?
    end
  end
end
