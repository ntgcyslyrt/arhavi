# encoding: utf-8

module AdminHelper

  def header_title foo
    bar = {
      'admin/admins' => 'Yöneticiler',
      'admin/students' => 'Öğrenciler',
      'admin/roles' => 'Roller',
      'admin/institutes' => 'Kurumlar',
    }
    bar[foo]
  end

end
