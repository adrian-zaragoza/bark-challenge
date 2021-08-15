class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  @@max_dogs_per_page = 5
  # GET /dogs
  # GET /dogs.json
  def index
    # sets the current page to 1 if there is no page params for index, otherwise sets it to the page params
    if !params[:page]
      @current_page = 1
    else
      @current_page = params[:page].to_i
    end
    
    # application controller method that updates the total pages.
    update_total_pages(@@max_dogs_per_page)
    
    @dogs = Dog.all.dogs_pages(@current_page, @@max_dogs_per_page)
  end

  # GET /dogs/1
  # GET /dogs/1.json
  def show
  end

  # GET /dogs/new
  def new
    @dog = Dog.new
  end

  # GET /dogs/1/edit
  def edit
  end

  # POST /dogs
  # POST /dogs.json
  def create
    if current_user
      @dog = Dog.new(dog_params.merge({owner_id: current_user.id}))
    else
      @dog = Dog.new(dog_params)
    end

    respond_to do |format|
      if @dog.save
        @dog.images.attach(params[:dog][:image]) if params[:dog][:image].present?
        update_total_pages(@@max_dogs_per_page)

        format.html { redirect_to @dog, notice: 'Dog was successfully created.' }
        format.json { render :show, status: :created, location: @dog }
      else
        format.html { render :new }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dogs/1
  # PATCH/PUT /dogs/1.json
  def update
    @dog = Dog.find_by(id: params[:id])

    # this will make sure that only the owner of the dog can update the dog.
    if current_user && current_user.id == @dog.owner_id

      respond_to do |format|
        if @dog.update(dog_params)
          @dog.images.attach(params[:dog][:image]) if params[:dog][:image].present?

          format.html { redirect_to @dog, notice: 'Dog was successfully updated.' }
          format.json { render :show, status: :ok, location: @dog }
        else
          format.html { render :edit }
          format.json { render json: @dog.errors, status: :unprocessable_entity }
        end
      end

    else
      respond_to do |format|
        format.html { redirect_to dog_url(@dog.id), notice: 'You are not authoried to edit this dog' }
        format.json { render json: "You are not authorized to edit this dog's profile", status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1
  # DELETE /dogs/1.json
  def destroy
    @dog.destroy
    update_total_pages(@@max_dogs_per_page)
    
    respond_to do |format|
      format.html { redirect_to dogs_url, notice: 'Dog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_params
      params.require(:dog).permit(:name, :description, images: [])
    end
end
