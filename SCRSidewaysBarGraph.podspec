Pod::Spec.new do |s|
  s.name         = "SCRSidewaysBarGraph"
  s.version      = "0.0.1"
  s.summary      = "A drop in class for using a sideways bar graph."
  s.homepage     = "https://github.com/MaxKramer"

  s.license      = "MIT"
  s.author             = { "Max Kramer" => "max@maxkramer.co" }
  s.social_media_url   = "http://twitter.com/MaxKramer"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/MaxKramer/SCRSidewaysBarGraph.git", :tag => "0.0.1" }
  s.source_files  = "src/*.{h,m}"
  s.framework  = "QuartzCore"
end
