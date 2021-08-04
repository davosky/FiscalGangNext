module ApplicationHelper
  def admin?
    current_operator.admin == true
  end

  def full_operator
    "#{current_operator.name} #{current_operator.last_name} - #{current_operator.category}"
  end

  def subscriber?(request)
    if request.subscriber == true
      'fas fa-square text-danger'
    else
      'fas fa-user text-success'
    end
  end

  def processed?(request)
    'bg-processed' if request.processed == true
  end
end