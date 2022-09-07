class OriginalTag < ApplicationRecord

    def product
        return Product.find_by(id: self.product_id)
    end

    def values
        return Value.where(original_tag_id: self.id)
    end

    def parent
        return OriginalTag.find_by(id: self.parent_id)
    end

    def children
        return OriginalTag.where(parent_id: self.id)
    end

    def hash_format
        values_hash = {}
        self.values.each do |value|
            values_hash[value.id] = value.hash_format
        end
        children_hash = []
        self.children.each do |child|
            children_hash.push(child.id)
        end
        return {name: self.name, children: children_hash, values: values_hash}
    end

end
