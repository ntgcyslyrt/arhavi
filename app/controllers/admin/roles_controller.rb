# encoding: utf-8

class Admin::RolesController < ApplicationController

  before_filter :require_admin

  def require_admin
    redirect_to '/admin/login' unless session[:admin]
  end

  def index
    @roles = Role.all
    @pagetitle = "Roller"
  end

  def new
    @pagetitle = "Rol Ekle"
  end

  def create
    if Role.new({:name => params[:name]}).save
      flash[:notice] = "Yeni Role Eklendi"
    else
      flash[:error] = "Role Eklenemedi"
    end
    redirect_to '/admin/roles'
  end

  def show
  end

  def edit
    @pagetitle = "Kayıt Düzenle"
    @record = Admin.find(:first, :conditions => {:id => params[:id]})
  end

  def update
    if Role.update(params[:id], { :name => params[:name] }).save
      flash[:notice] = "Rol Güncellendi."
    else
      flash[:error] = "Yönetici Güncellenemedi."
    end
    redirect_to "/admin/roles/#{params[:id]}"
  end

  def destroy
    if Role.delete(params[:role_id])
      flash[:notice] = "Kayıt Silindi"
    else
      flash[:error] = "Kayıt Silinemedi"
    end
    redirect_to '/admin/roles'
  end

end
