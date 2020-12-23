Pod::Spec.new do |s|
  s.name             = 'Notifire'
  s.version          = '2.0'
  s.summary          = 'Notifire can show a message. by : farhad faramarzi'

 
  s.homepage         = 'https://github.com/farhad1985/Notifire'
  s.author           = { 'Farhad Faramarzi' => 'farhad.public@gmail.com' }
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.source           = { :git => 'https://github.com/farhad1985/Notifire.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'Notifire/Notifire/**/*'
  s.swift_version = '5'
  s.exclude_files = 'Notifire/Notifire/*.plist'

end
