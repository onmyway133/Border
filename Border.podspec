Pod::Spec.new do |spec|
  spec.name         = 'Border'
  spec.version      = '1.0'
  spec.license      =  { :type => 'MIT', :file => 'LICENSE.md' }
  spec.homepage     = 'https://github.com/onmyway133/Border'
  spec.authors      = { 'Khoa Pham' => 'onmyway133@gmail.com' }
  spec.summary      = 'Make border for all views'
  spec.source       = { :git => 'https://github.com/onmyway133/Border.git', :tag => '1.0' }
  spec.source_files = 'Border/*.{h,m}'
  spec.requires_arc = true
  spec.platform     = :ios
  spec.ios.deployment_target = '6.0'
  spec.social_media_url   = "https://twitter.com/onmyway133"
end