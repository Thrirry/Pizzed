# Uncomment the next line to define a global platform for your project

platform :ios, '11.0'

def libraries
    # Pods for Pizzed
    pod 'RxSwift', '~> 4.0'
    pod 'RxCocoa', '~> 4.0'
    pod 'PINRemoteImage'
    pod 'SwiftLint'
    pod 'Kingfisher', '~> 4.0'
    
end

target 'Pizzed' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  libraries
end

target 'ServicePlatform' do
    use_frameworks!
    
    libraries
    pod 'SwiftDate', '4.5.0'
end
