ActiveAdmin.register Course do
permit_params :profile_id, :accepted_at, :datetime, :datetext,:created_at, :updated_at
end
