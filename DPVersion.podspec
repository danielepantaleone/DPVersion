Pod::Spec.new do |s|
  s.name                  = "DPVersion"
  s.version               = "1.0.0"
  s.summary               = "A struct to store and compare software version numbers (see https://semver.org)."
  s.license               = { :type => "MIT", :file => "LICENSE" }
  s.homepage              = "https://github.com/danielepantaleone/DPVersion"
  s.authors               = { "Daniele Pantaleone" => "danielepantaleone@me.com" }
  s.ios.deployment_target = "11.0"
  s.source                = { :git => "https://github.com/danielepantaleone/DPVersion.git", :tag => "#{s.version}" }
  s.source_files          = "Sources/DPVersion/**/*.swift"
  s.swift_version         = "5.7"
end
