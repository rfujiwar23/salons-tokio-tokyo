class SearchesController < ApplicationController

  def show
    @search = Search.find(params[:id])
  end

  def new
    @search = Search.new
    @address = Salon.distinct.pluck(:address)
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  private

  def search_params
    params.require(:search).permit(:name, :address)
  end




end
