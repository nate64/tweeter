class BiosController < ApplicationController

  def index
    @bios = Bio.all
  end

  def show
    @bio = Bio.find(params[:id])
  end

  def new
    # binding.pry
    # @bio = Bio.new(profile_image: "#{current_user.first_name}", user_id: current_user.id)
    
    
  end
  
  def create
    @bio = Bio.new(profile_image: "#{current_user.first_name}", user_id: current_user.id)

    if @bio.save
      redirect_to bio_path(@bio)
    else
      render :new
    end

  end

  def edit
  end

  def update
  end

  def destroy
    @bio = Bio.find(params[:id])
    @bio.destroy
    redirect_to bios_path

  end
end
