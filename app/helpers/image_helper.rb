# encoding: utf-8

module ImageHelper
  class Image
    @uploaddir = Rails.root.join 'public/uploads'
    @type = ['jpeg', 'jpg', 'png', 'gif']
    @size = 5 * 1024 * 1024 # 5Mb

    def self.upload savedir, savename, uploaded, overwrite = true

      # yüklenen dosya yok ise sessiz çık
      return nil unless File.exist? uploaded.path

      # dosya türünü belirleyelim
      content_type = uploaded.content_type.split("/")
      type = content_type[1]
      if @type.include?(type)
        @extension = '.' + type
      else
        return [false, "Resim istenmeyen bir formatta!"]
      end

      savename = savename.to_s                # resmin adı
      savename_ext = savename + @extension    # resmin tam adı
      destination = @uploaddir.join savedir   # dizin tam yolu
      image = destination.join savename_ext   # resmin tam yolu
      image_noext = destination.join savename # resmin tam yolu
      savename_new_ext = savename + '.jpeg'

      # <ana_dizin> yoksa oluşturalım
      unless File.exist? @uploaddir
        FileUtils.mkdir_p @uploaddir, :mode => 0755
        FileUtils.chmod_R 0755, @uploaddir
      end

      # hedef yoksa oluşturalım
      unless File.exist? destination
        FileUtils.mkdir_p destination, :mode => 0755
        FileUtils.chmod_R 0755, destination
      end

      if uploaded.size > @size
        return [false, "Resim çok büyük"]
      elsif File.exist?(image) && !(overwrite)
        return [false, "Resim zaten var"]
      elsif !FileUtils.mv(uploaded.path, image)
        return [false, "Dosya yükleme hatası"]
      else
        FileUtils.chmod 0644, image
        system("convert #{image} -resize 128x128 #{image_noext}.jpeg")
        system("rm -f #{image}") if type != 'jpeg'
        return [true, savename_new_ext] # resim yükleme başarısı
      end

      return nil
    end

    # resim var ise sil çık
    def self.delete id
      student = Students.find(:first, :conditions => {:id => id})
      if student and student[:image]
        image = @uploaddir.join student.image # resmin tam yolu
        FileUtils.rm(image) if File.exist? image # resim var ise sil.
      end
    end
  end
end
