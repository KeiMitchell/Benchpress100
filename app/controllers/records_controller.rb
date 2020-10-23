class RecordsController < ApplicationController

  def index
    @user
  end

  def new
    @record = Record.new
  end
end
