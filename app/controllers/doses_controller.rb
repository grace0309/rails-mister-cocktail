class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create, :destroy]
  def new
    @dose = Dose.new
  end

  def create
    @amount = params[:dose][:amount]
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose = Dose.new(description: "#{@amount}cc #{@ingredient.name}")
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "new"
    end
    @doses = Dose.all
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    @doses = Dose.all
    redirect_to cocktail_path(@cocktail)
  end

  private
    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end
end
