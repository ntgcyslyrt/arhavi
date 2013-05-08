# encoding: utf-8

class Admin::InstitutesController < ApplicationController

  before_filter :require_admin

  def require_admin
    redirect_to '/admin/login' unless session[:admin]
  end

  def index
    @institutes = Institute.all
    @pagetitle = "Kurumlar Listelendi"
  end

  def show
    @pagetitle = "Kurum Gösteriliyor"
  end

  def destroy
    if Institute.delete(params[:institute_id])
      flash[:notice] = "Kayıt Silindi"
    else
      flash[:error] = "Kayıt Silinemedi"
    end
    redirect_to '/admin/institutes'
  end

  def confirm
    if institute = Institute.find(params[:institute_id])
      foo = { 2 => 1, 1=> 2 }
      Institute.update(params[:institute_id], {:status => foo[institute[:status]]}).save
      flash[:notice] = "Kurum Güncellendi"
    else
      flash[:error] = "Böyle Bir Kurum Bulunamadı"
    end
    redirect_to "/admin/institutes"
  end

end
