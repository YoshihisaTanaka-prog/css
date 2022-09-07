class Product < ApplicationRecord

    def user
        return User.find_by(id: self.user_id)
    end

    def original_tags
        return OriginalTag.where(product_id: self.id)
    end

    def hash_format
        root_tag_hash = {}
        OriginalTag.where(product_id: self.id).each do |original_tag|
            root_tag_hash[original_tag.id] = original_tag.hash_format
        end
        return {name: self.name, tags: root_tag_hash}
    end

end
