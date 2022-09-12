class OriginalTag < ApplicationRecord

    def product
        return Product.find_by(id: self.product_id)
    end

    def values
        values = Value.where(original_tag_id: self.id)
        return values.sort_by{|x| x.title.name }
    end

    def parent
        return OriginalTag.find_by(id: self.parent_id)
    end

    def children
        return OriginalTag.where(parent_id: self.id).order(:name)
    end

    def order
        ret = [self.id]
        self.children.each do |child|
            ret = ret + child.order
        end
        return ret
    end

    def hash_format
        values_hash = {}
        order = []
        self.values.each do |value|
            values_hash[value.id] = value.hash_format
            order.push(value.id)
        end
        return {name: self.name, parentId: self.parent_id, values: values_hash, order: order}
    end

    def delete
        self.children.each do |child|
            child.delete
        end
        self.destroy
    end

end
