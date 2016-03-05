#
# Be sure to run `pod lib lint MSProgressSlider.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MSProgressSlider"
  s.version          = "0.1.0"
  s.summary          = "MSProgressSlider adds a second value to an UISlider"

  s.description      = <<-DESC
  The MSProgressSlider extends the UISlider with a second value. This value is displayed as a line behind the value line.
It can be used to show a loading progress.
                       DESC

  s.homepage         = "https://github.com/messeb/MSProgressSlider"
  s.license          = 'MIT'
  s.author           = "messeb"
  s.source           = { :git => "https://github.com/messeb/MSProgressSlider.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'MSProgressSlider' => ['Pod/Assets/*.png']
  }
end
