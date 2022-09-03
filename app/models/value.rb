class Value < ApplicationRecord
    def title
        return Title.find_by(id: self.title_id)
    end

    def hash
        return {title: self.title.name, value: self.value}
    end
end
