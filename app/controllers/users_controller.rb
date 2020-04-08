# frozen_string_literal: true

class UsersController < ApplicationController
  def profile; end

  private

  def user_params
    params.require(:user).permit(:login)
  end
end
