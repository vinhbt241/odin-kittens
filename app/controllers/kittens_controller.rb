class KittensController < ApplicationController
  def index 
    @kittens = Kitten.all
  end

  def show 
    @kitten = Kitten.find(params[:id])
  end
  
  def new 
    @kitten = Kitten.new
  end

  def create 
    @kitten = Kitten.new(kitten_params)

    if @kitten.save 
      redirect_to @kitten
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
    @kitten = Kitten.find(params[:id])
  end

  def update 
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      redirect_to @kitten
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy 
    @kitten = Kitten.find(params[:id])
    @kitten.destroy 
    
    redirect_to root_path, notice: "Event removed successfully", status: 303
  end

  private 

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
