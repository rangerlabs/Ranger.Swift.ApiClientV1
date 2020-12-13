#
# Be sure to run `pod lib lint Ranger.Swift.ApiClientV1.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Ranger.Swift.ApiClientV1'
  s.version          = '0.1.0'
  s.summary          = 'The Swift API client for Ranger.'
  s.swift_version = '5.0'
  
  s.description      = <<-DESC
Used to communicate requests to the Ranger v1 API.
                       DESC

  s.homepage         = 'https://github.com/rangerlabs/Ranger.Swift.ApiClientV1'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author           = { 'Ranger Labs' => 'Ranger Labs' }
  s.source           = { :git => 'https://github.com/rangerlabs/Ranger.Swift.ApiClientV1.git', :tag => s.version.to_s }
  s.social_media_url = 'https://linkedin.com/rangerlabs'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Ranger.Swift.ApiClientV1/Classes/**/*'
  s.dependency 'Alamofire', '~> 5.2'

end
