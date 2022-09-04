class Category < ApplicationRecord

    def title_ids
        ret = []
        CategoryTitle.where(category_id: self.id, is_enabled: true).each do |ct|
            ret.push(ct.title_id)
        end
        return ret
    end

    def hash_format
        return {name: self.name, titles: self.title_ids}
    end

end
