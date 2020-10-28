class RecordsController < ApplicationController

  def index
    @record = Record.order(updated_at: :desc).limit(1)
    @records = Record.where(user_id: current_user.id)
    @max = previous_max_record
    @data_array = []
    @records.each do |record|
      kilos = record.kilos.to_i
      reps = record.reps.to_i
      max = (kilos * (1 + (reps / 40.0)))
      @data_array << [record.created_at.strftime('%Y-%m-%d'),  max]
    end
  end

  def new
    @record = Record.new
  end

  def create
    Record.create(kilos: record_params[:kilos], reps: record_params[:reps], user_id: current_user.id) #create record with user_id
    @record = Record.order(updated_at: :desc).limit(1) #最新のレコードを取得し、@recordインスタンス変数に代入
    @max = previous_max_record
    @records = Record.where(user_id: current_user.id)
  end


  private
  def record_params
    params.require(:record).permit(:kilos, :reps)
  end

  def previous_max_record
    kilos = @record.pluck(:kilos).join.to_i
    reps = @record.pluck(:reps).join.to_i
    max = (kilos * (1 + (reps / 40.0))) #最大挙重量の計算式
  end

end
