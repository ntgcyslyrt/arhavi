# encoding: utf-8

class HomeController < ApplicationController

  include ImageHelper
  
  def index
  end

  def institute_register
  end

  def institute_register_save
    unless params[:password] == params[:password2]
      flash[:error] = "Parolalar Eslesmiyor"
      return render :action => "institute_register"
    end

    institute = Institute.new({
      :name => params[:name],
      :role_id => params[:role_id],
      :email => params[:email],
      :password => params[:password],
      :phone_number => params[:phone_number],
      :city_id => params[:city_id],
      :district_id => params[:district_id],
      :address => params[:address],
    })

    if institute.save
      if params[:image] and response = Image.upload('institutes', institute[:id], params[:image])
        institute[:image] = response[1] if response[0]
        institute.save
      end

      flash[:notice] = "Kaydiniz Alinmistir. Tesekkur Ederiz"
    else
      flash[:error] = "Kaydiniz Alinamadi"
    end
    redirect_to '/home/institute_register'
  end

  def dynamic_districts
    render :json => District.find_all_by_city_id(params[:id])
  end

  def login
    if request.post?
      path = '/login'

      if session[:userinfo] = Student.authenticate(params[:email], params[:password])
        session[:user] = true
        path = '/user'
      elsif session[:instituteinfo] = Institute.authenticate(params[:email], params[:password])
        session[:institute] = true
        path = '/institute'
      elsif session[:admininfo] = Admin.authenticate(params[:email], params[:password])
        session[:admin] = true
        path = '/admin'
      elsif params[:email] or params[:password]
        flash[:error] = "Kullanici adı veya parola hatalı! Lutfen tekrar deneyiniz"
      end

      redirect_to path
    end
  end

  def google_create
    auth = request.env['omniauth.auth']
    email = auth['info']['email']
    path = '/login'

    if session[:userinfo] = Student.find_by_email(email)
      session[:user] = true
      path = '/user'
    elsif session[:instituteinfo] = Institute.find_by_email(email)
      session[:institute] = true
      path = '/institute'
    elsif session[:admininfo] = Admin.find_by_email(email)
      session[:admin] = true
      path = '/admin'
    else
      flash[:error] = "Kullanici adı veya parola hatalı! Lutfen tekrar deneyiniz"
    end

    redirect_to path
  end

  def logout
    reset_session
    redirect_to '/login', :notice => "Başarılı bir şekilde sistemden çıkış yapıldı."
  end

end
