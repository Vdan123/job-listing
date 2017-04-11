class Job < ApplicationRecord
    def publish!
        self.is_hidden = false
        save
      end

    def hide!
        self.is_hidden = true
        save
    end
end
