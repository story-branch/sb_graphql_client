require_relative 'lib/story_branch/graphql/version'

Gem::Specification.new do |spec|
  spec.name          = 'story_branch-graphql'
  spec.version       = StoryBranch::Graphql::VERSION
  spec.authors       = ["Rui Baltazar"]
  spec.email         = ["rui.p.baltazar@gmail.com"]

  spec.summary       = 'Very simple GraphQL client'
  spec.description   = <<~DESCRIPTION
    This simple gem allows you to make GraphQL requests and parses the response
    into a simple structure with helper methods to validate if it's a successful
    response or not
  DESCRIPTION
  spec.homepage      = 'https://github.com/story-branch/sb_graphql_client'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/story-branch/sb_graphql_client/issues',
    'changelog_uri' => 'https://github.com/story-branch/sb_graphql_client/blob/master/Changelog.md',
    'documentation_uri' => 'https://github.com/story-branch/sb_graphql_client/blob/master/README.md',
    'source_code_uri' => 'https://github.com/story-branch/sb_graphql_client',
    'homepage_uri' => spec.homepage
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'httparty', '>0'

  spec.add_development_dependency 'standard', '~> 1.15'
end
