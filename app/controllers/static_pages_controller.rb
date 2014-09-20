class StaticPagesController < ApplicationController
  before_action :signed_in_user, only: [:home]

  def home
  end

  def welcome
  end

  def help
  end

  def about
  end

  def feedback
  end

  private

    def signed_in_user
      unless signed_in?
        redirect_to welcome_path
      end
    end
end
