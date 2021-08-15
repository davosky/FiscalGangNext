module ApplicationHelper
  def admin?
    current_operator.admin == true
  end

  def full_operator
    "#{current_operator.name} #{current_operator.last_name} - #{current_operator.category}"
  end

  def caaf_operator
    "#{current_operator.name} #{current_operator.last_name}"
  end

  def subscriber?(request)
    if request.subscriber == true
      "fas fa-square text-danger"
    else
      "fas fa-user text-success"
    end
  end

  def processed?(request)
    if request.processed == true
      "bg-processed"
    elsif request.unprocessable == true
      "bg-unprocessed"
    end
  end

  def disabled?(request)
    unless request.first_call != true
      "disabled"
    end
  end
end
