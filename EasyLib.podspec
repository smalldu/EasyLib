#
# Be sure to run `pod lib lint EasyLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EasyLib'
  s.version          = '0.2.9'
  s.summary          = 'A short description of EasyLib.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/smalldu/EasyLib'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'smalldu' => '363958265@qq.com' }
  s.source           = { :git => 'https://github.com/smalldu/EasyLib.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
#  s.resource = 'EasyLib/Assets/*'
  s.source_files = 'EasyLib/Classes/**/*.{swift,h,m}'
#  s.resource_bundles = {
#    'EasyLibModule' => ['EasyLib/Assets/*']
#  }
   s.resource_bundles = {
     'EasyLib' => ['EasyLib/Assets/*']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
#  s.dependency 'SnapKit'
end
