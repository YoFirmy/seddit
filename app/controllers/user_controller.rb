# frozen_string_literal: true

# User Controller
class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
end
