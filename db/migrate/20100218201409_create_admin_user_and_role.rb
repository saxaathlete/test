class CreateAdminUserAndRole < ActiveRecord::Migration
  def self.up
    Role.create(:role => 'admin', :permission => Role::Permissions::ALL)

    ActiveRecord::Base.connection.execute(%Q!
      INSERT INTO `users` (`last_request_at`, `created_at`, `crypted_password`, `perishable_token`,
                           `updated_at`, `username`, `failed_login_count`, `current_login_ip`,
                           `password_salt`, `current_login_at`, `persistence_token`, `login_count`,
                           `roles_mask`, `last_login_ip`, `last_login_at`, `roles`, `email`, `active`)
                            VALUES(NULL, '2010-02-18 20:17:40', 'cff9566bf07b52fd9feae36f68c0ca4cae0954588d3b171bcf8e3e1ed14b0984e47147a57862adef1c3045d599f9e4ac89788d8f473155725372fc9221073ece',
                            '1692b251e79bbf851d33e8c7ba3a61d058fe178060952cb22e8e2f0bf6cac3a206fa2ed2dcd2e0e63f3e25f17838828d055756ce74c3372e0afc6536dc165171',
                            '2010-02-18 20:17:40',
                           'admin', 0, NULL, 'tcLC5nbWEbANpHMbHTJ6', NULL, 'D2wDzDpbbxGlZUIUC_Rl',
                            0, 1, NULL, NULL, "--- []", 'saxa88888@mail.ru', NULL)
      !)
    u = User.find_by_username('admin')
    u.add_role "admin"
    u.save
  end

  def self.down
    Role.find_by_role("admin").delete
    User.find_by_username("admin").delete
  end
end
