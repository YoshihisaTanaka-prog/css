class Value < ApplicationRecord
    def title
        return Title.find_by(id: self.title_id)
    end

    def hash_format
        return {title: self.title.name, title_id: self.title.id, value: self.value}
    end
end
