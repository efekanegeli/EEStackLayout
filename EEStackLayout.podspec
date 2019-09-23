Pod::Spec.new do |s|
  s.name             = 'EEStackLayout'
  s.version          = '0.1.88'
  s.summary          = 'A structured vertical/horizontal stackview'

  s.description      = <<-DESC
A structured vertical/horizontal stackview which takes subviews with different widths and adds them to its rows/columns depending on the target orientation with paddings, spacings etc.
                       DESC

  s.homepage         = 'https://github.com/efekanegeli/EEStackLayout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Efekan Egeli' => 'efekanegeli@gmail.com' }
  s.source           = { :git => 'https://github.com/efekanegeli/EEStackLayout.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = 'EEStackLayout/EEStackLayout.swift'

end
