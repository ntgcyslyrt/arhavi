class Admin::InstituterequestsController < ApplicationController
  before_filter :require_admin

  def require_admin
    redirect_to '/admin/login' unless session[:admin]
  end

  def index
    @pagetitle = "Kurum Istegi"
  end

  def show
    @pagetitle = "Kurum Istegi Gosteriliyor"
  end

  def destroy
    if InstituteRequest.delete(params[:instituterequest_id])
      flash[:notice] = "Kurum Istegi Silindi"
    else
      flash[:error] = "Kurum Istegi Silinemedi"
    end
    redirect_to '/admin/instituterequests'
  end

  def confirm
    if instituterequest = InstituteRequest.find(params[:instituterequest_id])
      foo = { 2 => 1, 1=> 2 }
      InstituteRequest.update(params[:institute_id], {:status => foo[instituterequest[:status]]}).save
      flash[:notice] = "Kurum Guncellendi"
    else
      flash[:error] = "Boyle Bir Kurum Istegi Bulunamadi"
    end
    redirect_to '/admin/instituterequests'
  end

end
