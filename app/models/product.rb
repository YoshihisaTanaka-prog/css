class Product < ApplicationRecord

    def user
        return User.find_by(id: self.user_id)
    end

    def original_tags
        return OriginalTag.where(product_id: self.id)
    end

    def hash_format
        root_tag_hash = {}
        order = []
        OriginalTag.where(product_id: self.id).order(:name).each do |original_tag|
            root_tag_hash[original_tag.id] = original_tag.hash_format
            if original_tag.parent_if == 0
                order = order + original_tag.order
            end
        end
        return {name: self.name, tags: root_tag_hash, order: order}
    end

end
