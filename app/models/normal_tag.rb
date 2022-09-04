class NormalTag < ApplicationRecord
    def hash_format
        return {name: self.name}
    end
end
