class Operation < ApplicationRecord

    def units
        ret = []
        OpUnit.where(operation_id: self.id, is_enabled: true).each do |ou|
            unit = Unit.find_by(id: ou.unit_id)
            ret.push(unit) unless unit.nil?
        end
        return ret
    end

    def hash_format
        units_hash = {}
        order = []
        self.units.each do |unit|
            units_hash[unit.id] = unit.hash_format
            order.push(unit.id)
        end
        return {name: self.name, units: units_hash, order: order}
    end

end
