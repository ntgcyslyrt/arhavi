# encoding: utf-8

class UserController < ApplicationController

  include ImageHelper

  before_filter :require_login, :except => [:login, :sign_in, :logout]

  def require_login
    redirect_to '/user/login' unless session[:user]
  end

  def login
    redirect_to '/user' if session[:user]
  end

  def sign_in
    if session[:userinfo] = Student.authenticate(params[:email], params[:password])
      session[:user] = true
    elsif params[:email] or params[:password]
      flash[:error] = "Kullanici adi veya parola hatali! Lutfen tekrar deneyiniz"
    end
    redirect_to '/user/login'
  end

  def logout
    reset_session
    session[:userinfo] = nil
    redirect_to '/user', :notice => "Basarili bir sekilde sistemden cikis yapildi."
  end

  def index
  end

  def personal_save
    student = Student.update(session[:userinfo][:id], {
      :tc => params[:tc],
      :first_name => params[:first_name],
      :last_name => params[:last_name],
      :gender => params[:gender],
      :birthday => params[:birthday],
      :email => params[:email],
      :password => params[:password],
      :phone_number => params[:phone_number],
      :city_id => params[:city_id],
      :district_id => params[:district_id],
      :address => params[:address]
    })

    if student.save
      if params[:image] and response = Image.upload('students', student[:id], params[:image])
        student[:image] = response[1] if response[0]
        student.save
      end
      session[:userinfo] = student
      flash[:notice] = "Bilgileriniz Guncellenmistir."
    else
      flash[:error] = "Bilgileriniz Guncellenemedi."
    end
    redirect_to '/user/personal'
  end

  def password_save
    if params[:new_password] != params[:new_password2]
      flash[:error] = "Yeni Parolalar Eslesmiyor"
    elsif Student.authenticate(session[:userinfo][:email], params[:old_password])
      if Student.update(session[:userinfo][:id], { :password => params[:new_password] }).save
        flash[:notice] = "Parolaniz Basariyla Degistirildi"
      else
        flash[:error] = "Parola Degistirilemedi"
      end
    else
      flash[:error] = "Kullanimda Olan Parolanizi Yanlis Girdiniz"
    end

    redirect_to '/user/password'
  end

  def support
  end

  def institutes
  end

  def institute_register
  end

  def location
  end

  def location_save
      probation_location = ProbationLocation.new({
      :student_no => params[:student_no],
      :probation_type => params[:probation_type],
      :institute_name => params[:institute_name],
      :start_date => params[:start_date],
      :finish_date => params[:finish_date],
    })

    if probation_location.save
      flash[:notice] = "Bilgileriniz Sistem Yöneticilerine Ulaştırıldı. Teşekkür Ederiz"
    else
      flash[:error] = "İstek Gönderilemedi"
    end
    redirect_to '/user/location'
  end
end
