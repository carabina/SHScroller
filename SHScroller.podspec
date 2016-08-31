#
# Be sure to run `pod lib lint SHScroller.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SHScroller'
  s.version          = '0.3.0'
  s.summary          = 'Secret Scroller for TabViewController'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
You can change tabs vertically with a secret scroller.
                       DESC

  s.homepage         = 'https://github.com/sh0mi/SHScroller'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sho Miyamoto' => 'laveritefigaro+cocoa@gmail.com' }
  s.source           = { :git => 'https://github.com/sh0mi/SHScroller.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'SHScroller/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SHScroller' => ['SHScroller/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
