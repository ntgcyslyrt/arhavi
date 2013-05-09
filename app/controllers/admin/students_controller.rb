# encoding: utf-8
class Admin::StudentsController < ApplicationController
 
   include ImageHelper

  before_filter :require_admin

  def require_admin
    redirect_to '/admin/login' unless session[:admin]
  end

  def index
    @pagetitle = "Öğrenciler"
  end

  def new
    @pagetitle = "Yeni Öğrenci"
  end

  def create
    unless params[:password] == params[:password2]
      flash[:error] = "Parolalar Eşleşmiyor"
      return redirect_to '/admin/students/new'
    end

    student = Student.new({
      :first_name => params[:first_name],
      :last_name => params[:last_name],
      :email => params[:email],
      :password => params[:password].to_s,
      :phone_number => params[:phone_number]
    })
    if student.save
      flash[:notice] = "Yeni Bir Öğrenci Başarıyla Eklendi"
      redirect_to "/admin/students/#{student[:id]}"
    else
      flash[:error] = "Öğrenci Eklenemedi"
      redirect_to '/admin/students/new'
    end
  end

  def show
    @pagetitle = "Öğrenci Gösteriliyor"
  end

  def edit
    @pagetitle = "Kayıt Düzenle"
    @record = Student.find(:first, :conditions => {:id => params[:id]})
  end

  def update
    student = Student.update(params[:id], {
      :first_name => params[:first_name],
      :last_name => params[:last_name],
      :email => params[:email],
      :phone_number => params[:phone_number],
    })

    if student.save
      if params[:image] and response = Image.upload('students', student[:id], params[:image])
        student[:image] = response[1] if response[0]
        student.save
      end
      session[:userinfo] = student
      flash[:notice] = "Öğrenci Güncellenmiştir."
    else
      flash[:error] = "Öğrenci Güncellenemedi."
    end
    redirect_to "/admin/students/#{params[:id]}"
  end

  def destroy
    if Student.delete(params[:student_id])
      flash[:notice] = "Kayıt Silindi"
    else
      flash[:error] = "Kayıt Silinemedi"
    end
    redirect_to '/admin/students'
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
