class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all
    respond_to do |format|
      format.html
      format.json { render :json => @properties.to_json }
      format.pdf { render :layout => false }
    end
  end

  def my_list
    @properties = current_user.properties.all
    respond_to do |format|
      format.html {render :action => "index"}
      format.json { render :json => @properties.to_json }
      format.pdf { render :action => "index",:layout => false }
    end
  end

  def search
    key = "%#{params[:query]}%"

    @properties = Property.where('name LIKE :search OR state LIKE :search OR location LIKE :search OR property_type LIKE :search', search: key)

    respond_to do |format|
      format.html {render :action => "index"}
      format.json { render :json => @properties.to_json }
      format.pdf { render :action => "index", :layout => false }
    end
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = current_user.properties.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to '/properties', notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:name, :address, :state, :country, :map_position, :property_type, :user_id, :location)
    end
end
