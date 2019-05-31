Pod::Spec.new do |s|
  s.name         = "Dupnium"
  s.version      = "1.1.2"
  s.author       = { "Bas van Kuijck" => "bas@e-sites.nl" }
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.homepage     = "http://www.e-sites.nl"
  s.summary      = "Localization made easy"
  s.source       = { :git => "https://github.com/e-sites/Dupnium.git", :tag => "v#{s.version}" }
  s.source_files = "Sources/*.{swift,h}"
  s.platform     = :ios, '10.0'
  s.requires_arc  = true
  s.swift_versions = [ '4.2', '5.0' ]

  s.subspec 'Core' do |ss|
    ss.source_files = "Sources/Core/**/*.{h,swift}"
  end

  s.subspec 'UI' do |ss|
    ss.source_files = "Sources/UI/**/*.{h,swift}"
    ss.dependency 'Dupnium/Core'
  end

  s.default_subspec = 'Core'
end
