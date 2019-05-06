class ComediansController < ApplicationController


  def index
    @comedians = Comedian.all
    # require "pry"; binding.pry
    @specials = Special.all
    @comedians = Comedian.where(age: params[:age]) if params[:age]
    # @specials = @comedians.map(&:specials).flatten

    @comedians = Comedian.name_sort if params[:sort] == "name"

    @comedians = Comedian.city_sort if params[:sort] == "city"
    
    @comedians = Comedian.age_sort if params[:sort] == "age"

  end

  def new
  end

  def show
    @comedian = Comedian.find(params[:id])
  end

  def create
    @comedian = Comedian.new(comedian_params)
    @comedian.save
    redirect_to comedians_path
  end

  private

  def comedian_params
    params.require(:comedian).permit(:name, :age, :city)
  end



end
