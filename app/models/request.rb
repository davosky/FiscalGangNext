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

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :mobile, presence: true
  # validates :unprocessable_reason, presence: true, :unless => :unprocessable?
  validates :category_id, presence: true, if: :is_subscriber?

  def is_subscriber?
    self.subscriber
  end
end
