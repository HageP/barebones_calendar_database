ActiveAdmin.register Event do

 permit_params :day_of_week, :apartment_id, :tenant_id, :status_id, :lease_id, :title, :description, :start_time, :end_time, :resourceId

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
