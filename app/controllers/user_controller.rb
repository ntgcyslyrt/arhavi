# encoding: utf-8

class UserController < ApplicationController

  include ImageHelper

  before_filter :require_login

  def require_login
    redirect_to '/login' unless session[:user]
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

  def files
    if file_id = params[:student_file_id]
      if params[:download] == 'true'
        file = StudentFile.find(file_id)

        send_file(
          file.file.path,
          :disposition => 'attachment',
          :filename => "#{file.name}#{File.extname(file.file.to_s).downcase}"
        )
      elsif params[:destroy] == 'true'
        StudentFile.find(file_id).destroy
        flash[:notice] = "Dosya silindi"
        redirect_to user_files_path
      end
    elsif request.post?
      file = StudentFile.new(params[:student_file])
      if file.save
        file.update_attributes(:file => "#{file.id}#{file.file}")
        flash[:notice] = "Dosya kaydedildi"
      else
        flash[:error] = "Dosya kaydedilemedi. Lütfen tekrar deneyin."
      end

      redirect_to user_files_path
    end

    @student_files = StudentFile.where(student_id: session[:userinfo].id)
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
