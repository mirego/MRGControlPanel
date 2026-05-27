Pod::Spec.new do |s|
  s.name     = 'MRGControlPanel'
  s.version  = '0.0.8'
  s.license  = 'BSD 3-Clause'
  s.summary  = 'Library to create a backdoor control panel for your application.'
  s.homepage = 'http://open.mirego.com'
  s.authors  = { 'Mirego' => 'info@mirego.com' }
  s.source   = { :git => 'https://github.com/mirego/MRGControlPanel.git', :tag => s.version.to_s }
  s.source_files = 'Sources/MRGControlPanel/**/*.{h,m}'
  s.requires_arc = true
  s.frameworks = 'MessageUI'

  s.platform = :ios, '12.0'
end
