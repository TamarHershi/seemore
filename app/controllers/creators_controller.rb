class CreatorsController < ApplicationController
  has_many :categories
  has_many :users, through :categories
end
