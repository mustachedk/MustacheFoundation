
Pod::Spec.new do |s|
    s.name             = 'MustacheFoundation'
    s.version          = '2.2.1'
    s.summary          = 'Helper methods used at Mustache when creating new apps.'
    s.homepage         = 'https://github.com/mustachedk/MustacheFoundation'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Tommy Sadiq Hinrichsen' => 'th@mustache.dk' }
    s.source           = { :git => 'https://github.com/mustachedk/MustacheFoundation.git', :tag => s.version.to_s }
    s.swift_version = '5.1'

    s.ios.deployment_target = '11.0'

    s.source_files = 'Sources/MustacheFoundation/Classes/**/*'
    s.preserve_paths = 'Sources/MustacheFoundation/Assets/**/*'
    s.frameworks = 'Foundation'

end
