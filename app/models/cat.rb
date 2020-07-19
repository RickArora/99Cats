require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper
class Cat < ApplicationRecord
    SEX = ['M','F']
    COLORS_LIST = ['blue','yellow','red']
    validates :birth_date, presence: true 
    validates :color, inclusion: { in:  COLORS_LIST }, presence: true
    validates :name, :description, presence: true
    validates :sex, inclusion: {in: SEX} ,presence: true
    
    def age 
        current_time = Date.today
        birth_time = Date.parse(:birth_date)
        current_age = distance_of_time_in_words(birth_time, current_time)
        current_age
    end

    has_many(:cat_rental_requests,[
        primary_key: :id, 
        foreign_key: :cat_id,
        class_name: :cat_rental_requests
    ])
end
