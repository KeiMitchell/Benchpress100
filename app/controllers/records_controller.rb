class RecordsController < ApplicationController

  def index
    @records = Record.all #@recordsというインスタンス変数にrecordsテーブルのレコードを全て代入
  end

  def new
    @record = Record.new #creating a new record
  end

  def create
    Record.create(kilos: record_params[:kilos], reps: record_params[:reps], user_id: current_user.id) #create record with user_id
    @records = Record.where(user_id: current_user.id)
  end


  private
  def record_params
    params.require(:record).permit(:kilos, :reps)
  end
end
