class MemoriesController < ApplicationController
  before_action :set_memorie, only: %i[show edit update destroy]

  def index
    @memories = Memorie.all
  end

  def show
  end

  def new
    @memorie = Memorie.new
  end

  def create
    @memorie = Memorie.new(memorie_params)
    @memorie.team_id = current_user.team_id
    if @memorie.save
      redirect_to memory_path(@memorie)
    else
      puts @memorie.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @memorie = Memorie.find(params[:id])
    if @memorie.update(memorie_params)
      redirect_to @memorie
    else
      render :edit
    end
  end

  def destroy
    @memorie = Memorie.find(params[:id])
    @memorie.destroy
    redirect_to memories_path
  end

  private

  def memorie_params
    params.require(:memorie).permit(:name, :content, :date, :photo)
  end

  def set_memorie
    @memorie = Memorie.find(params[:id])
  end
end
