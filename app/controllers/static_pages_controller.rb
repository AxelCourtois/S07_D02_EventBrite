class StaticPagesController < ApplicationController
  def index
    before_action :authenticate_user!, only: [:secret]
  end

  def secret
  end
end
