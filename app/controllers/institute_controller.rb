# encoding: utf-8

class InstituteController < ApplicationController

  include ImageHelper
  include PdfHelper

  before_filter :require_login

  def require_login
    redirect_to '/login' unless session[:institute]
  end

  def personal_save
    institute = Institute.update(session[:instituteinfo][:id], {
      :name => params[:name],
      :role_id => params[:role_id],
      :email => params[:email],
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
      session[:instituteinfo] = institute
      flash[:notice] = "Bilgileriniz Başarıyla Güncellenmiştir."
    else
      flash[:error] = "Bilgileriniz Güncellenemedi."
    end
    redirect_to '/institute/personal'
  end

  def password_save
    if params[:new_password] != params[:new_password2]
      flash[:error] = "Yeni Parolalar Eşleşmiyor"
    elsif Institute.authenticate(session[:instituteinfo][:email], params[:old_password])
      if Institute.update(session[:instituteinfo][:id], { :password => params[:new_password] }).save
        flash[:notice] = "Parolanız Başarıyla Değiştirildi"
      else
        flash[:error] = "Parola Değiştirilemedi"
      end
    else
      flash[:error] = "Kullanımda Olan Parolanızı Yanlış Girdiniz"
    end

    redirect_to '/institute/password'
  end
  def request_save
    institute_request = InstituteRequest.new({
      :institute_id => session[:instituteinfo][:id],
      :probation_advert_id => params[:probation_advert_id],
      :content => params[:content],
    })

    if institute_request.save
      flash[:notice] = "İsteğiniz Sistem Yöneticilerine Ulaştırıldı. Teşekkür Ederiz"
    else
      flash[:error] = "İstek Gönderilemedi"
    end
    redirect_to '/institute/request'
  end
end

