# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'

target 'CurrencyConverter' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CurrencyConverter

pod 'Resolver'
pod 'RxSwift', '6.5.0'
pod 'RxCocoa', '6.5.0'
pod 'Moya/RxSwift', '~> 15.0'
end


post_install do |pi|
   pi.pods_project.targets.each do |t|
       t.build_configurations.each do |bc|
           if bc.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] == '14.0'
             bc.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
           end
       end
   end
end
