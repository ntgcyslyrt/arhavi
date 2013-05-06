class HomeController < ApplicationController
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
  #def logout
    #reset_session
    #session[:instituteinfo] = nil
    #redirect_to '/home'
  #end

  def dynamic_districts
    render :json => District.find_all_by_city_id(params[:id])
  end
end
