class AdminsController < ApplicationController
    before_action -> { only_admin(2) }
    def index
        @admins = Admin.all.order(:email)
    end

end
