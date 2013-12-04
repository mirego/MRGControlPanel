Pod::Spec.new do |s|
  s.name     = 'MRGControlPanel'
  s.version  = '0.0.1'
  s.license  = 'BSD 3-Clause'
  s.summary  = 'Tasteful library for common social interactions on iOS.'
  s.homepage = 'https://github.com/mirego/MRGControlPanel'
  s.authors  = { 'Mirego' => 'info@mirego.com' }
  s.source   = { :git => 'https://github.com/mirego/MRGControlPanel.git', :tag => s.version.to_s }
  s.source_files = 'MRGControlPanel/*.{h,m}'
  s.requires_arc = true
  s.frameworks = 'Accounts', 'Social'
  s.ios.deployment_target = '6.0'
end
