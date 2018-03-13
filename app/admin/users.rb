ActiveAdmin.register User do
  permit_params :email, :phone_number, :first_name, :last_name,  :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at,
    :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :created_at, :updated_at,
    :provider, :uid, :token, :profile_id, :profile_type, :admin

end
