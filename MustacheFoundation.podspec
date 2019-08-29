
Pod::Spec.new do |s|
    s.name             = 'MustacheFoundation'
    s.version          = '0.2.7'
    s.summary          = 'Helper methods used at Mustache when creating new apps.'
    s.homepage         = 'https://github.com/mustachedk/MustacheFoundation'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Tommy Sadiq Hinrichsen' => 'th@mustache.dk' }
    s.source           = { :git => 'https://github.com/mustachedk/MustacheFoundation.git', :tag => s.version.to_s }
    s.swift_version = '5.0'

    s.ios.deployment_target = '11.0'

    s.source_files = 'MustacheFoundation/Classes/**/*', 'MustacheFoundation/Assets/**/*'
    s.frameworks = 'Foundation'
    s.script_phase = { :name => 'CommonCrypto', :script => 'sh ${PODS_ROOT}/MustacheFoundation/install_common_crypto.sh', :execution_position => :before_compile }

end
