class RequestsController < ApplicationController
  before_action :set_request, only: %i[show edit update destroy]

  def index
    @operator = current_operator
    @q = Request.ransack(params[:q])
    @requests = if @operator.category == "CESI" || @operator.category == "CAAF"
      @q.result(distinct: true).order("created_at DESC").page(params[:page])
    else
      @q.result(distinct: true).order("created_at DESC").where(operator_id: current_operator.id).page(params[:page])
    end
  end

  def show
  end

  def new
    @request = Request.new
  end

  def edit
  end

  def create
    @operator = current_operator
    @request = @operator.requests.build(request_params)
    respond_to do |format|
      if @request.save
        format.html { redirect_to requests_path }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @operator = current_operator
    @full_operator = "#{@operator.name} #{@operator.last_name}"
    @request.updater = @full_operator
    @request.update(request_params)
  end

  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: "Request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(
      :name, :date, :practice_id, :first_name,
      :last_name, :mobile, :email, :subscriber,
      :category_id, :note, :operator_id,
      :processed, :updater, :unprocessable,
      :unprocessable_reason, :first_call,
      :first_call_date, :second_call,
      :second_call_date, :third_call,
      :third_call_date, :first_call_updater,
      :second_call_updater, :third_call_updater
    )
  end
end
