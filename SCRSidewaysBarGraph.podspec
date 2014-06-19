Pod::Spec.new do |s|
  s.name         = "SCRSidewaysBarGraph"
  s.version      = "0.0.2"
  s.summary      = "A drop in class for using a sideways bar graph."
  s.homepage     = "https://github.com/MaxKramer"
  s.requires_arc = true
  s.license      = "MIT"
  s.author             = { "Max Kramer" => "max@maxkramer.co" }
  s.social_media_url   = "http://twitter.com/MaxKramer"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/MaxKramer/SCRSidewaysBarGraph.git", :tag => "v0.0.2" }
  s.source_files  = "src/*.{h,m}"
  s.framework  = "QuartzCore"
  s.screenshot = "http://f.cl.ly/items/3P420I1t2B181b3V183x/Image%202014-06-20%20at%2012.09.44%20am.png"
end
