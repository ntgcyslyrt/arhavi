# encoding: utf-8

module PdfHelper
  def studentspdf students
    pdf = Prawn::Document.new(:page_size => 'A5', :layout => 'portrait') do
      font "#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf", :size => 8

      text "Staj Yönetim Sistemi", :size => 14, :align => :center
      text "Staj Yönetimi", :size => 10, :align => :center
      move_down(20)
      text "Öğrenci Listesi", :size => 11, :align => :center
      move_down(20)

      info = [['id', 'Adı', 'Soyadı', 'Cinsiyet', 'İl', 'İlçe']]
      donors.each do |donor|
        info << [
          donor.id,
          donor.first_name,
          donor.last_name,
          donor.gender,
          donor.city.city,
          donor.district.district
        ]
      end

      table info,
        :column_widths => { 0 => 20, 1 => 55, 2 => 55, 3 => 30, 4 => 35, 5 => 55, 6 => 55, 7 => 25 },
        :cell_style => {:size => 5, :text_color => "000000", :height => 15, :border_width => 0.1 }

      move_down(20)
      text "http://staj.herokuapp.com/", :size => 5, :align => :center
      move_down(5)
      text "copyright © #{Time.now.strftime("%Y")} Staj Yönetim Sistemi", :size => 5.5, :align => :center
    end
  end
end
