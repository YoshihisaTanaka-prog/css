class NormalTag < ApplicationRecord
    def hash
        return {name: self.name}
    end
end
