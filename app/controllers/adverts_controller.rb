class AdvertsController < ApplicationController
  before_action :set_advert, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :homepage
  skip_authorize_resource :only => :homepage
  # GET /adverts
  # GET /adverts.json
  def index

    if params[:titleSearch].nil?
      if params[:category_id].nil?
        @adverts = Advert.all
        @adverts = Advert.order(:title)
        @categories = Category.all
      else
        @adverts = Advert.where(:category_id => params[:category_id]).order(:title)
        @categories = Category.all
        flash[:notice] = "Existem <b>#{@adverts.count}</b> anúncios nessa categoria".html_safe
      end

    else
      if params[:category_id].nil?
        @adverts = Advert.titleSearch(params[:titleSearch]).order(:title)
        @categories = Category.all
      else
        @adverts = Advert.where(:category_id => params[:category_id]).order(:title)
        @adverts = Advert.titleSearch(params[:titleSearch]).order(:title)
        @categories = Category.all
        flash[:notice] = "Existem <b>#{@adverts.count}</b> anúncios nessa categoria".html_safe
      end

    end

    if params[:id].nil?
      @adverts = Advert.all
      @adverts = Advert.order(:title)
      @categories = Category.all
    else
      @adverts = Advert.where(:user_id => params[:id]).order(:title)
      @categories = Category.all
    end

    end

  # GET /adverts/1
  # GET /adverts/1.json
  def show
    @adverts = Advert.all
  end

  # GET /adverts/new
  def new
    @advert = Advert.new
    @advert.images = params[:images]
  end

  # GET /adverts/1/edit
  def edit
    if can? :manage, @advert

    else
      redirect_to home_index_url
    end
  end

  # POST /adverts
  # POST /adverts.json
  def create
    @advert = Advert.new(advert_params)
    @advert.user = current_user
    respond_to do |format|
      if @advert.save
        format.html { redirect_to @advert, notice: 'Advert was successfully created.' }
        format.json { render :show, status: :created, location: @advert }
      else
        format.html { render :new }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adverts/1
  # PATCH/PUT /adverts/1.json
  def update
    respond_to do |format|
      if @advert.update(advert_params)
        format.html { redirect_to @advert, notice: 'Advert was successfully updated.' }
        format.json { render :show, status: :ok, location: @advert }
      else
        format.html { render :edit }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adverts/1
  # DELETE /adverts/1.json
  def destroy
    @advert.destroy
    respond_to do |format|
      format.html { redirect_to adverts_url, notice: 'Advert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advert
      @advert = Advert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advert_params
      params.require(:advert).permit(:title, :description, :price, :category_id, :user_id, {images: []}, :titleSearch)
    end
end
