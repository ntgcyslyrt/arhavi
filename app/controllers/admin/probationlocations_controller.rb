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
  def confirm
    if probationlocation = ProbationLocation.find(params[:probationlocation_id])
      foo = { 2 => 1, 1=> 2 }
      ProbationLocation.update(params[:probationlocation_id], {:status => foo[probationlocation[:status]]}).save
      flash[:notice] = "Kurum Guncellendi"
    else
      flash[:error] = "Boyle Bir Kurum Bulunamadi"
    end
    redirect_to "/admin/probationlocations"
  end

end
