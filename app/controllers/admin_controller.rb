# encoding: utf-8

class AdminController < ApplicationController

  include ImageHelper

  before_filter :require_admin

  def require_admin
    redirect_to '/login' unless session[:admin]
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
    if params[:static] == 'role_institute'
      @pagetitle = "Kurum ve Kuruluş İstatistikleri"
      template = "statistic/role_institute"
    end
    render :action => template
  end

end
