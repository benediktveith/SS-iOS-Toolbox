Pod::Spec.new do |s|

  s.name         = "SS-iOS-Toolbox"
  s.version      = "1.0.4"
  s.summary      = "Useful Toolbox for upcoming projects"
  s.description  = <<-DESC
  					* Toolbox including:
					*
					* CoreDataManager
					* FileHelper
					* NetworkingMain
					* AlertController
					* CurrentViewControllerHelper
          * Background Thread UI Debugger
          * SSExtension
                   DESC
  s.homepage      = "https://github.com/scherersoftware/SS-iOS-Toolbox.git"
  s.license   	  = { :type => "MIT", :file => "LICENSE" }
  s.author        = "Scherer Software"
  s.platform  	  = :ios, "7.0"
  s.source        = { :git => "https://github.com/scherersoftware/SS-iOS-Toolbox.git", :tag => "1.0.4" }
  s.source_files  = "SSToolbox/*.{h,m}"
  s.dependency 		"AFNetworking"

end
