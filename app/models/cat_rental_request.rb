class CatRentalRequest < ApplicationRecord
    STATUS = ['PENDING', 'APPROVED', 'DENIED']
    validates :start_date, :end_date, :cat_id, presence: true
    validates :status,inclusion: {in: STATUS}, presence: true

    belongs_to(:cat, [
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :cat
    ], dependent: :destroy)

end
