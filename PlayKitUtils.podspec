
Pod::Spec.new do |s|
  
  s.name             = 'PlayKitUtils'
  s.version          = '0.1.1'
  s.summary          = 'PlayKitUtils -- utilities framework of common code base for playkit-ios'
  s.homepage         = 'https://github.com/kaltura/playkit-ios-utils'
  s.license          = { :type => 'AGPLv3', :file => 'LICENSE' }
  s.author           = { 'Kaltura' => 'community@kaltura.com' }
  s.source           = { :git => 'https://github.com/kaltura/playkit-ios-utils.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'Sources/**/*'

end
