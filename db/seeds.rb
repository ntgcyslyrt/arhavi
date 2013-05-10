# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Student.count == 0
  Student.create(:tc => '12345678901', :first_name => 'Tugce', :last_name => 'Yesilyurt', :email => 'nty@bil.omu.edu.tr', :password => '123456', :phone_number => '0544 111 11 11', :gender => "Kadin", :birthday => "25-10-1991", :address => "Foo Mah. Bar Sok. No:42 Baz/Samsun", :city_id => 55, :district_id => 7)
  Student.create(:tc => '12312312312', :first_name => 'Seda', :last_name => 'Dogan', :email => 'seda@bil.omu.edu.tr', :password => '123456', :phone_number => '0541 111 11 11', :gender => "Kadin", :birthday => "11-11-1989", :address => "Foo Mah. Bar Sok. No:42 Baz/Samsun", :city_id => 33, :district_id => 4)
  Student.create(:tc => '13452345234', :first_name => 'Begum', :last_name => 'Topyildiz', :email => 'beg@bil.omu.edu.tr', :password => '123456', :phone_number => '0532 111 11 11', :gender => "Kadin", :birthday => "21-05-1991", :address => "Foo Mah. Bar Sok. No:42 Baz/Samsun", :city_id => 51, :district_id => 1)
  Student.create(:tc => '12345678901', :first_name => 'Canan', :last_name => 'Demirel', :email => 'kcd@bil.omu.edu.tr', :password => '123456', :phone_number => '0542 111 11 11', :gender => "Kadin", :birthday => "15-02-1990", :address => "Foo Mah. Bar Sok. No:42 Baz/Samsun", :city_id => 52, :district_id => 3)
end
if Role.count == 0
  Role.create(:name => 'Yazilim')
  Role.create(:name => 'Donanim')
  Role.create(:name => 'Yazilim-Donanim')
end
if Admin.count == 0
  Admin.create(:first_name => 'Tugce', :last_name => 'Yesilyurt', :email => 'nty@bil.omu.edu.tr', :password => '123456')
  Admin.create(:first_name => 'Seda', :last_name => 'Dogan', :email => 'seda@bil.omu.edu.tr', :password => '123456')
  Admin.create(:first_name => 'Begum', :last_name => 'Topyildiz', :email => 'beg@bil.omu.edu.tr', :password => '123456')
  Admin.create(:first_name => 'Canan', :last_name => 'Demirel', :email => 'kcd@bil.omu.edu.tr', :password => '123456')
end
if ProbationAdvert.count == 0
   ProbationAdvert.create(:sayi => '1')
   ProbationAdvert.create(:sayi => '2')
   ProbationAdvert.create(:sayi => '3')
   ProbationAdvert.create(:sayi => '4')
   ProbationAdvert.create(:sayi => '5')
   ProbationAdvert.create(:sayi => '6')
   ProbationAdvert.create(:sayi => '7')
   ProbationAdvert.create(:sayi => '8')
   ProbationAdvert.create(:sayi => '9')
   ProbationAdvert.create(:sayi => '10')
end
