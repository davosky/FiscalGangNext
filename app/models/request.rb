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

  before_save :set_first_call_date, :set_second_call_date, :set_third_call_date
  def set_first_call_date
    self.first_call_date = Date.today if first_call?
  end

  def set_second_call_date
    self.second_call_date = Date.today if second_call?
  end

  def set_third_call_date
    self.third_call_date = Date.today if third_call?
  end

  def first_call?
    first_call
  end

  def second_call?
    second_call
  end

  def third_call?
    third_call
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
