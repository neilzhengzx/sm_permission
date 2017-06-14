
Pod::Spec.new do |s|
  s.name         = "SMOSmPermission"
  s.version      = "1.0.0"
  s.summary      = "SMOSmPermission"
  s.description  = <<-DESC
                  SMOSmPermission
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/author/SMOSmPermission.git", :tag => "master" }
  s.source_files  = "SMOSmPermission/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  