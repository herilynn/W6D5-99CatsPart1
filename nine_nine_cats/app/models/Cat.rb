class Cat < ApplicationRecord
    require 'action_view'
    include ActionView::Helpers::DateHelper

    CAT_COLORS = ["black", "white", "brown", "gray", "orange"]

    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion: {in: CAT_COLORS}
    validates :sex, inclusion: {in: ["M", "F"]}
    validate :past_birth_date


    def past_birth_date
        if birth_date > Date.today
            errors.add(:birth_date, "Birthday cannot be in the future")
        end
    end

    def age
        time_ago_in_words(birth_date)
    end
end
