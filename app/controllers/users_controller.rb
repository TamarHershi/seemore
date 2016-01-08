class UsersController < ApplicationController
  has_many :categories
  has_many :creators, through :categories

  def show
  end

end
