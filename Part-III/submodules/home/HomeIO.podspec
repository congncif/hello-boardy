Pod::Spec.new do |s|
  s.name = "HomeIO"
  s.version = "0.1.0"
  s.summary = "A short description of HomeIO."

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

  s.source_files = "IO/**/*.swift"

  s.dependency "Boardy"
end
