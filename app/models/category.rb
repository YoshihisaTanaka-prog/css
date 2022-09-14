class Category < ApplicationRecord

    def title_ids
        ret = []
        CategoryTitle.where(category_id: self.id, is_enabled: true).each do |ct|
            if Title.find_by(id: ct.title_id)
                ret.push(ct.title_id)
            else
                ct.destroy
            end
        end
        return ret
    end

    def titles
        title_list = []
        self.title_ids.each do |title_id|
            title_list.push( Title.find_by(id: title_id) ) if Title.find_by(id: title_id)
        end
        return title_list.sort_by{ |x| x.name }
    end

    def hash_format
        title_ids = []
        self.tites.each do |title|
            title_ids.push( title.id )
        end
        return {name: self.name, titles: title_ids}
    end

end
