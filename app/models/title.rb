class Title < ApplicationRecord
    
    validates :name, uniqueness: true

    def operation
        return Operation.find_by(id: self.operation_id)
    end

    def hash_format
        return {name: self.name, operation: self.operation.hash_format}
    end

    def categories
        ret = []
        self.category_ids.each do |c_id|
            ret.push(Category.find_by(id: c_id)) if Category.find_by(id: c_id)
        end
        return ret
    end

    def category_ids
        ret = []
        CategoryTitle.where(title_id: self.id, is_enabled: true).each do |ct|
            ret.push(ct.category_id)
        end
        return ret
    end

    def save_and_set ct_list
        self.save
        self.set_ct ct_list
    end

    def update_and_set title_params, ct_list
        logger.debug title_params
        self.name = title_params[:name]
        self.operation_id = title_params[:operation_id]
        self.set_ct ct_list
    end

    private
    def set_ct ct_list
        
        selected_list = []
        if ct_list
            ct_list.each do |ct|
                selected_list.push(ct.to_i)
            end
        end
        
        all_list = []
        CategoryTitle.all.order(:id).each do |ct|
            all_list.push(ct.id)
        end

        unselected_list = []
        all_list.each do |ct|
            unselected_list.push(ct) unless selected_list.include?(ct)
        end

        selected_list.each do |selected_ct|
            ct = CategoryTitle.find_by(category_id: selected_ct, title_id: self.id)
            if ct.blank?
                ct = CategoryTitle.new()
                ct.title_id = self.id
                ct.category_id = selected_ct
                ct.save
            elsif !ct.is_enabled
                ct.is_enabled = true
                ct.save
            end
        end

        unselected_list.each do |unselected_ct|
            ou = CategoryTitle.find_by(category_id: unselected_ct, title_id: self.id)
            if ou.blank?
            elsif ou.is_enabled
                ou.is_enabled = false
                ou.save
            end
        end
    end
end
