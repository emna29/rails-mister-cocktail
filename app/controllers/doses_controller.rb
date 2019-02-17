class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    if params[:dose][:ingredient_id].blank?
      render :new
    else
      @cocktail = Cocktail.find(params[:cocktail_id])
      p @cocktail
      @dose = Dose.new(dose_params)
      p @dose
      @dose.cocktail = @cocktail
      if @dose.save
        redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.find(params[:id])
    @dose.cocktail = @cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end


  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
