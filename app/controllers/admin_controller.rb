# encoding: utf-8

class AdminController < ApplicationController

  #include ImageHelper

  before_filter :require_admin, :except => [:login, :sign_in, :logout, :google_create]

  def require_admin
    redirect_to '/admin/login' unless session[:admin]
  end

  def login
    redirect_to '/admin' if session[:admin]
  end

  def sign_in
    if session[:admininfo] = Admin.authenticate(params[:email], params[:password])
      session[:admin] = true
    elsif params[:email] or params[:password]
      flash[:error] = "Kullanıcı adı veya parola hatalı! Lütfen tekrar deneyiniz"
    end
    redirect_to '/admin/login'
  end

  def logout
    reset_session
    session[:admininfo] = nil
    redirect_to '/admin/login'
  end

  def index
    @pagetitle = "Yönetim"
  end

  def personal
    @pagetitle = "Kişisel Bilgiler"
  end

  def personal_save
    admin = Admin.update(session[:admininfo][:id], {
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
      flash[:notice] = "Bilgileriniz Güncellenmiştir."
    else
      flash[:error] = "Bilgileriniz Güncellenemedi."
    end
    redirect_to '/admin/personal'
  end

  def export
    foo = {
      'admins' => 'Admin',
      'students' => 'Student',
      'institutes' => 'Institute',
      'roles' => 'Role',
    }
    render :text => "burası export: #{params[:c]}"
  end

  def support
    @pagetitle = "Yardım"
  end

  def statistic
    template = "statistic/statistic"
    @pagetitle = "İstatistikler"
    #if params[:static] == 'city_donor'
     # @pagetitle = "İllere Göre Donör İstatistikleri"
      #template = "statistic/city_donor"
    #elsif params[:static] == 'blood_donor'
     # @pagetitle = "Kan Grubu İstatistikleri"
      #template = "statistic/blood_donor"
    if params[:static] == 'role_institute'
      @pagetitle = "Kurum ve Kuruluş İstatistikleri"
      template = "statistic/role_institute"
    end
    render :action => template
  end

end
