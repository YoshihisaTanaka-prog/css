class NormalTag < ApplicationRecord
    validates :name, uniqueness: true
    def hash_format
        return {name: self.name}
    end
end
