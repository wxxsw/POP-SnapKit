Pod::Spec.new do |s|

  s.name          = "POP+SnapKit"
  s.version       = "3.0.2"
  s.summary       = "Use SnapKit with the Facebook Pop animation framework."
  s.homepage	  = "https://github.com/wxxsw/POP-SnapKit"
  s.license       = "MIT"

  s.author        = { "GeSen" => "i@gesen.me" }

  # Swift code is built as dynamic framework by CocoaPods, while dynamic frameworks works on iOS8+
  s.platform      = :ios, "8.0"

  s.source        = { :git => "https://github.com/wxxsw/POP-SnapKit.git", :tag => "#{s.version}" }
  s.source_files  = "Source/**/*"
  s.requires_arc  = true

  s.dependency "pop", "~> 1.0.9"
  s.dependency "SnapKit", "~> 3.0.2"

end
