Pod::Spec.new do |s|
  s.name = 'Nine41'
  s.version = '2.3.1'
  s.license = 'MIT'

  s.summary = 'Automate overriding the status bars for all running iOS simulators'
  s.homepage = 'https://github.com/jessesquires/Nine41'
  s.social_media_url = 'https://www.jessesquires.com'
  s.author = 'Jesse Squires'

  s.source = { :git => 'https://github.com/jessesquires/Nine41.git', :tag => s.version }
  s.source_files = 'Sources/**/*'

  s.swift_version = '5.9'

  s.ios.deployment_target = '11.0'
  s.osx.deployment_target = '11.0'
end
