class Cat < ApplicationRecord
  CAT_COLORS = ["black", "white", "brown", "gray", "orange"]
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: {in: CAT_COLORS}
  validates :sex, inclusion: {in: ["M", "F"]}
end