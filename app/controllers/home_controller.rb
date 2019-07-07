class HomeController < ApplicationController
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
end
