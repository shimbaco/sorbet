Gem::Specification.new do |s|
  s.name        = 'sorbet-static'
  s.version     = '0.0.0'
  s.summary     = 'A Typechecker for Ruby'
  s.description = 'The Sorbet typechecker binary'
  s.authors     = ['Stripe']
  s.email       = 'sorbet@stripe.com'
  s.files       = ['libexec/sorbet']
  s.executables = []
  s.homepage    = 'https://sorbet.run'
  s.license     = 'Apache-2.0'

  # We include a pre-built binary (in libexec/), making us platform dependent.
  s.platform = Gem::Platform::CURRENT

  s.required_ruby_version = ['>= 2.3.0', '< 2.7.0.preview1']
end
