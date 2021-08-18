class Request < ApplicationRecord
  belongs_to :practice
  belongs_to :category, optional: true
  belongs_to :operator

  before_create :set_name, :set_date

  def set_name
    last_name = Request.maximum(:name)
    self.name = last_name.to_i + 1
  end

  def set_date
    self.date = Date.today
  end

  before_save :set_first_call, :set_second_call, :set_third_call

  def set_first_call
    if first_call? && first_call_date?
    elsif first_call?
      self.first_call_date = Date.today
    end
  end

  def set_second_call
    if second_call? && second_call_date?
    elsif second_call?
      self.second_call_date = Date.today
    end
  end

  def set_third_call
    if third_call? && third_call_date?
    elsif third_call?
      self.third_call_date = Date.today
    end
  end

  def first_call?
    first_call
  end

  def first_call_date?
    first_call_date
  end

  def second_call?
    second_call
  end

  def second_call_date?
    second_call_date
  end

  def third_call?
    third_call
  end

  def third_call_date?
    third_call_date
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :mobile, presence: true
  validates :unprocessable_reason, presence: true, if: :unprocessable?
  validates :category_id, presence: true, if: :subscriber?

  def unprocessable?
    unprocessable
  end

  def subscriber?
    subscriber
  end
end
