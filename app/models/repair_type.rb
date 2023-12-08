class RepairType < ApplicationRecord
    enum name: { light: 'light', medium: 'medium', heavy: 'heavy' }
end
