module FormatsErrors
  def first_error_on(attr)
    these_errors = self.errors[attr]
    if these_errors.any?
      return '<div class="error_text">' + these_errors.first + '</div>'
    else
      return ''
    end
  end
end