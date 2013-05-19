class Admin::ProbationlocationsController < ApplicationController
 
  before_filter :require_admin
  def require_admin
    redirect_to '/admin/login' unless session[:admin]
  end

  def index
    @pagetitle = "Ogrenci Staj Bilgisi"
  end

  def show
    @pagetitle = "Ogrenci Staj Bilgisi Gosteriliyor"
  end

  def destroy
    if ProbationLocation.delete(params[:probationlocation_id])
      flash[:notice] = "Ogrenci Istegi Silindi"
    else
      flash[:error] = "Ogrenci Istegi Silinemedi"
    end
    redirect_to '/admin/probationlocations'
  end

end
