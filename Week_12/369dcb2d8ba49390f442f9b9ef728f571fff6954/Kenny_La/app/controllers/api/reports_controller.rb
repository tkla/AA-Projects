class Api::ReportsController < ApplicationController
  before_action :set_report, only: [:show, :update, :destroy]

  def index
    @reports = Report.all
  end

  def show
  end

  def create
    @report = Report.new(report_params)

    if @report.save
      render :show
    else
      render json: @report.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @report.update(report_params)
      render :show
    else
      render json: @report.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @report.destroy
    head :no_content
  end

  private

  def set_report
    @report = Report.find(params[:id])
  rescue
    render json: ['Report not found'], status: :not_found
  end

  def report_params
    params.require(:report).permit(:improvement, :understanding)
  end
end
