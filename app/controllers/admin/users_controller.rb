module Admin
  class UsersController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :home ]

    def new
      user = User.new
    end

  end
end
