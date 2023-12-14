Pod::Spec.new do |s|
    s.name             = 'ResolverProtocol'
    s.version          = '0.1.0'
    s.summary          = 'A short description of ResolverProtocol.'
    s.homepage         = "https://stash.odkl.ru/projects/IOS/repos/odnoklassniki-ios/browse"
    s.author           = { 'Dmitry Rybochkin' => 'dmitry.rybochkin@corp.mail.ru' }
    s.source           = { :git => 'https://github.com/OK-mobile/ResolverProtocol.git', :tag => '0.1.0' }
    s.ios.deployment_target = '12.0'
    s.swift_version = '5.2'

    s.prefix_header_file = false
    s.source_files = 'Classes/**/*.{swift}'

    s.frameworks = 'Foundation'

end
