source 'https://github.com/CocoaPods/Specs.git'

inhibit_all_warnings!  # 关闭所有警告
install! 'cocoapods', :deterministic_uuids => false
use_frameworks!   # 用framework替代静态库，用于swift

def basic
pod 'PagingMenuController', '~> 2.2.0'
end

def debug
configs = ['Debug']
pod 'Reveal-SDK', '4', :configurations => configs
pod 'MLeaksFinder', :configurations => configs
pod 'FBRetainCycleDetector', :git => 'https://github.com/facebook/FBRetainCycleDetector.git', :branch => 'master', :configurations => configs
pod 'OOMDetector', '~> 1.3', :configurations => configs
end


target 'Natural' do
platform :ios, '9.0'
basic
debug
end


#在Debug模式下，设置Optimization level = None方便断点调试
post_install do |installer|
installer.pods_project.build_configurations.each do |config|
if config.name.include?('Debug')
# Set optimization level for project
config.build_settings['GCC_OPTIMIZATION_LEVEL'] = '0'
# Add DEBUG to custom configurations containing 'Debug'
# Fix Inke_Test_Debug 模式下第三方库 #ifdef DEBUG 失效
config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)']
if !config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'].include? 'DEBUG=1'
config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] << 'DEBUG=1'
end
# Enable assertions for target
config.build_settings['ENABLE_NS_ASSERTIONS'] = 'YES'
end
config.build_settings['SWIFT_VERSION'] = '4.1'
end
end


