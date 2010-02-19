class Role < ActiveRecord::Base

  module RoleTypes
    SITE = "site"
    GAME = "game"

    ALL = [SITE, GAME]
  end

  module Permissions
    ALL = 1
    USER_CREATE = 2

 
    ALL_PERMISSION = ALL & USER_CREATE
  end

  validates_presence_of :role, :role_type, :permission
#  validate_uniqueness_of :role

  def self.has_permission? role, permission
    role = Role.find_by_role role
    return true if role.all_permission?
    return !(role.permission && permission).zero? unless role.blank?
    false
  end

  def all_permission?
    self.permission == Permissions::ALL
  end

end
