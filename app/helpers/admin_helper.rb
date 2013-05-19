# encoding: utf-8

module AdminHelper

  def header_title foo
    bar = {
      'admin/admins' => 'Yöneticiler',
      'admin/students' => 'Öğrenciler',
      'admin/roles' => 'Roller',
      'admin/institutes' => 'Kurumlar',
      'admin/instituterequests' => 'Kurum Özel İstekleri',
      'admin/probationlocations' => 'Öğrenci Staj Yeri Bilgi',
    }
    bar[foo]
  end

end
