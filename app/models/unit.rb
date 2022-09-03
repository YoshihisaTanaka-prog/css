class Unit < ApplicationRecord

    def hash
        return {name: self.name}
    end

    def operation_id_list
        ret = []
        OpUnit.where(unit_id: self.id, is_enabled: true).each do |ou|
            ret.push(ou.operation_id)
        end
        return ret
    end

    def save_and_set op_list
        self.save
        self.set_op op_list
    end

    def update_and_set unit_params, op_list
        self.update(unit_params)
        self.set_op op_list
    end

    private
    def set_op op_list
        
        selected_list = []
        op_list.each do |op|
            selected_list.push(op.to_i)
        end
        
        all_list = []
        Operation.all.order(:id).each do |op|
            all_list.push(op.id)
        end

        unselected_list = []
        all_list.each do |op|
            unselected_list.push(op) unless selected_list.include?(op)
        end

        selected_list.each do |selected_op|
            ou = OpUnit.find_by(operation_id: selected_op, unit_id: self.id)
            if ou.blank?
                ou = OpUnit.new()
                ou.unit_id = self.id
                ou.operation_id = selected_op
                ou.save
            elsif !ou.is_enabled
                ou.is_enabled = true
                ou.save
            end
        end

        unselected_list.each do |unselected_op|
            ou = OpUnit.find_by(operation_id: unselected_op, unit_id: self.id)
            if ou.blank?
            elsif ou.is_enabled
                ou.is_enabled = false
                ou.save
            end
        end
    end

end
