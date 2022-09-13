class Operation < ApplicationRecord

    def units
        ret = []
        OpUnit.where(operation_id: self.id, is_enabled: true).order(:name).each do |ou|
            unit = Unit.find_by(id: ou.unit_id)
            ret.push(unit) unless unit.nil?
        end
        return ret
    end

    def hash_format
        units_hash = {}
        self.units.each do |unit|
            units_hash[unit.id] = unit.hash_format
        end
        return {name: self.name, units: units_hash}
    end

end
