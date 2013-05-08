# encoding: utf-8

module AdminHelper

  def header_title foo
    bar = {
      'admin/admins' => 'Yöneticiler',
      'admin/donors' => 'Donörler',
      'admin/roles' => 'Roller',
      'admin/institutes' => 'Kurumlar',
      'admin/donorrequests' => 'Donör İstekleri',
      'admin/bloodmakings' => 'Kayıtlı Kan Verme',
    }
    bar[foo]
  end

end
