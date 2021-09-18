Pod::Spec.new do |s|
  s.name = "Home"
  s.version = "0.1.0"
  s.summary = "A short description of Home."

  s.description = <<-DESC
TODO: Add long description of the pod here.
                  DESC

  s.homepage = "https://github.com/ifsolution"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "[iF] Solution" => "solution.if@gmail.com" }
  s.source = { :git => "git@github.com:ifsolution/Home.git", :tag => s.version.to_s }
  s.social_media_url = "https://twitter.com/congncif"

  s.ios.deployment_target = "10.0"
  s.swift_versions = ["5.3", "5.4"]

  # s.static_framework = true

  s.source_files = "Sources/**/*.swift"
  s.resources = "Sources/**/*.{xib,storyboard,strings,xcassets}"

  s.dependency "HomeIO"
  s.dependency "HelloAuthIO"
  s.dependency "GHSearchIO"

  s.dependency "Boardy/ModulePlugin"
  s.dependency "SiFUtilities"
  
  # s.dependency "SwiftMessages"
  # s.dependency "Localize-Swift/LocalizeSwiftCore"

  # s.dependency "Firebase/Storage"
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => '"${PODS_ROOT}/Firebase/CoreOnly/Sources"' }
end
