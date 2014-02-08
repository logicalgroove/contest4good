module ValidatePage

  def login_as_teacher
    @_teacher ||= FactoryGirl.create(:teacher)
    login_as(@_teacher, scope: :teacher, run_callbacks: false)
  end

  def login_as_student
    @_student ||= FactoryGirl.create(:student)
    login_as(@_student, scope: :student, run_callbacks: false)
  end

  def validate_page(args = {})
    check_content args[:content]
    check_flash_errors args[:errors]
  end

  def check_flash_errors(container = nil)
    container ||= "body div.main-content div.alert-danger"
    if selector = page.has_selector?(container)
      unless block_given?
        raise page.find(container).text
      else
        yield(selector)
      end
    end
  end

  def check_content(container = nil)
    container ||= "body div.page-content"
    selector = page.find(container)
    raise "NoContent" if selector.text == ""
    yield(selector) if block_given?
   end
end