Gem::Specification.new do |s|
  s.name      = 'deployem'
  s.version   = '0.0.5'
  s.summary   = 'A simple gem for Heroku deployments in a git-flowish strategy.'
  s.authors   = ['Casey Li']
  s.email     = ['info@bitesite.ca']
  s.files     = ['lib/deployem.rb', 'lib/deployem/railtie.rb', 'lib/tasks/deploy.rake']
  s.homepage  = 'https://github.com/bitesite/deployem'
  s.license   = 'MIT'
end