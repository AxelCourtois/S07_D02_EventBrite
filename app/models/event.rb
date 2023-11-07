class Event < ApplicationRecord
  has_many :users, through: :attendances
  has_many :attendances
  
  validates :start_date_credible, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0, multiple_of: 5 }
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :location, presence: true

  def start_date_credible
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "La date ne peut pas être dans le passé")
    end
  end

end

