class HomeController < ApplicationController
  def index

    if params[:titleSearch].nil?
      if params[:category_id].nil?
        if params[:id].nil?
          @adverts = Advert.all
          @adverts = Advert.order(:views).order(:title)
          @categories = Category.all
        else
          @adverts = Advert.where(:user_id => params[:id]).order(:views).order(:title)
          @categories = Category.all
        end

      else
        if params[:id].nil?
          @adverts = Advert.where(:category_id => params[:category_id]).order(:views).order(:title)
          @categories = Category.all
          flash[:notice] = "Existem <b>#{@adverts.count}</b> anúncios nessa categoria".html_safe
        else
          @adverts = Advert.where(:category_id => params[:category_id]).order(:views).order(:title)
          @adverts = Advert.where(:user_id => params[:id]).order(:views).order(:title)
          @categories = Category.all
        end

      end

    else
      if params[:category_id].nil?
        if params[:id].nil?
          @adverts = Advert.titleSearch(params[:titleSearch]).order(:views).order(:title)
          @categories = Category.all
        else
          @adverts = Advert.titleSearch(params[:titleSearch]).order(:views).order(:title)
          @adverts = Advert.where(:user_id => params[:id]).order(:views).order(:title)
          @categories = Category.all
        end

      else
        if params[:id].nil?
          @adverts = Advert.where(:category_id => params[:category_id]).order(:views).order(:title)
          @adverts = Advert.titleSearch(params[:titleSearch]).order(:views).order(:title)
          @categories = Category.all
          flash[:notice] = "Existem <b>#{@adverts.count}</b> anúncios nessa categoria".html_safe
        else
          @adverts = Advert.where(:category_id => params[:category_id]).order(:views).order(:title)
          @adverts = Advert.titleSearch(params[:titleSearch]).order(:views).order(:title)
          @adverts = Advert.where(:user_id => params[:id]).order(:views).order(:title)
          @categories = Category.all
          flash[:notice] = "Existem <b>#{@adverts.count}</b> anúncios nessa categoria".html_safe
        end

      end

    end


  end
end
