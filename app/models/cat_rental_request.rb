class CatRentalRequest < ApplicationRecord
    STATUS = ['PENDING', 'APPROVED', 'DENIED']
    validates :start_date, :end_date, :cat_id, presence: true
    validates :status,inclusion: {in: STATUS}, presence: true

    belongs_to(:cat, [
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :cat
    ], dependent: :destroy)

    def overlapping_requests 
        CatRentalRequest.where.not('end_date < #{self.start_date} OR start_date > #{self.end_date}').where('where cat_id = #{self.cat_id}')
    end

    def overlapping_approved_requests
        overlapping_requests.where('id = #{self.id}')
    end

    def does_not_overlap_approved_request
        !overlapping_approved_requests.exists
    end
end
