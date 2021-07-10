class Api::V1::RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  def index
    recipes = Recipe.order(created_at: :desc)
    render json: { status: 'SUCCESS', message: 'Loaded recipes', data: recipes }
  end

  def show
    render json: { status: 'SUCCESS', message: 'Loaded the recipe', data: @recipe }
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      render json: { status: 'SUCCESS', data: recipe }
    else
      render json: { status: 'ERROR', data: recipe.error }
    end
  end

  def destroy
    @recipe.destroy
    render json: { status: 'SUCCESS', message: 'Deleted the recipe', data: '@recipe' }
  end

  def update
    if @recipe.update(recipe_params)
      render json: { status: 'SUCCESS', message: 'Updated the recipe', data: @recipe }
    else
      render json: { status: 'ERROR', message: 'Not update', data: @recipe.error }
    end
  end

  private

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.permit(:name, :explanation, :foodstuff, :how)
    end
end
