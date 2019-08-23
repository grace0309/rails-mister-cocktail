class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
     if @cocktail.save
      @cocktails = Cocktail.all
      redirect_to @cocktail
    else
      render :new
    end
  end

   def destroy
    @cocktail.destroy
    @cocktails = Cocktail.all
    redirect_to cocktails_path
  end

  private

    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    def cocktail_params
      params.require(:cocktail).permit(:name, :photo)
    end
end
