class UsersController < ApplicationController
  def new
    @identity = self.env['omniauth.identity'] || Identity.new
  end
end
