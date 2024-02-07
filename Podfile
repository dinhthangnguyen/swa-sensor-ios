# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'SWASensoriOS' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SWASensoriOS
  pod 'Alamofire', '~> 5.8.1'
  pod 'CoreModule', :path => './CoreModule'
  pod 'ReportingModule', :path => './ReportingModule'
  pod 'AMSModule', :path => './AMSModule'
  pod 'SMSModule', :path => './SMSModule'

  target 'SWASensoriOSTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SWASensoriOSUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["IPHONEOS_DEPLOYMENT_TARGET"] = "16.0"
    end
  end
end
