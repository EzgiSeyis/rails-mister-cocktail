class DosesController < ApplicationController
  before_action :set_cocktail
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.save
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render "cocktails/show"
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
