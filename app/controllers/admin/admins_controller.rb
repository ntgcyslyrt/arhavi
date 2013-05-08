# encoding: utf-8

class Admin::AdminsController < ApplicationController

  include ImageHelper

  before_filter :require_admin

  def require_admin
    redirect_to '/admin/login' unless session[:admin]
  end

  def index
    @pagetitle = "Yöneticiler"
  end

  def new
    @pagetitle = "Yeni Yönetici"
  end

  def create
    unless params[:password] == params[:password2]
      flash[:error] = "Parolalar Eşleşmiyor"
      return redirect_to '/admin/admins/new'
    end

    admin = Admin.new({
      :first_name => params[:first_name],
      :last_name => params[:last_name],
      :email => params[:email],
      :password => params[:password].to_s,
      :phone_number => params[:phone_number]
    })
    if admin.save
      flash[:notice] = "Yeni Bir Yönetici Başarıyla Eklendi"
      redirect_to "/admin/admins/#{admin[:id]}"
    else
      flash[:error] = "Yönetici Eklenemedi"
      redirect_to '/admin/admins/new'
    end
  end

  def show
    @pagetitle = "Yönetici Gösteriliyor"
  end

  def edit
    @pagetitle = "Kayıt Düzenle"
    @record = Admin.find(:first, :conditions => {:id => params[:id]})
  end

  def update
    admin = Admin.update(params[:id], {
      :first_name => params[:first_name],
      :last_name => params[:last_name],
      :email => params[:email],
      :phone_number => params[:phone_number],
    })

    if admin.save
      if params[:image] and response = Image.upload('admins', admin[:id], params[:image])
        admin[:image] = response[1] if response[0]
        admin.save
      end
      session[:admininfo] = admin
      flash[:notice] = "Yönetici Güncellenmiştir."
    else
      flash[:error] = "Yönetici Güncellenemedi."
    end
    redirect_to "/admin/admins/#{params[:id]}"
  end

  def destroy
    if Admin.delete(params[:admin_id])
      flash[:notice] = "Kayıt Silindi"
    else
      flash[:error] = "Kayıt Silinemedi"
    end
    redirect_to '/admin/admins'
  end

  def export
    # foo = {
    #   'admins' => 'Admin',
    #   'students' => 'Student',
    #   'institutes' => 'Institute',
    #   'roles' => 'Role',
    # }
  end

end
