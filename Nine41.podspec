#
# Be sure to run `pod lib lint Nine41.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Nine41'
  s.version          = '2.0.1'
  s.summary          = 'Automate overriding the status bars for all running iOS simulators'

  s.description      = <<-DESC
  This script fixes most of the issues with `simclt status_bar` that shipped with Xcode 11. It overrides the status bars for all currently running simulators using "Apple's defaults" — full cellular bars, full wifi bars, full battery, no "carrier" name, and 9:41 for the time.
                       DESC

  s.homepage         = 'https://www.jessesquires.com/'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jesse Squires' => 'email@email.com' }
  s.source           = { :git => 'https://github.com/jessesquires/Nine41.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/jesse_squires'

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.15'
  s.swift_version = '5.0'

  s.source_files = 'Sources/**/*'
  
  # s.resource_bundles = {
  #   'Nine41' => ['Nine41/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
