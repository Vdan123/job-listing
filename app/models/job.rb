class Job < ApplicationRecord
    has_many :resumes

    scope :published, -> { where(is_hidden: false) }
    scope :recent, -> { order('created_at DESC') }
    def publish!
        self.is_hidden = false
        save
      end

    def hide!
        self.is_hidden = true
        save
    end
end
