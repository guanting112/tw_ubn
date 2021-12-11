# frozen_string_literal: true

require_relative "lib/tw_ubn/version"

Gem::Specification.new do |spec|
  spec.name          = "tw_ubn"
  spec.version       = TwUbn::VERSION
  spec.authors       = ["Guanting Chen"]
  spec.email         = nil

  spec.summary       = "TwUbn 台灣公司統一編號驗證器 (Taiwan unified business number validator)"
  spec.description   = "方便您在 ruby 校驗，台灣公司統一編號資料。(支援財政部2021版6月規則更新)"
  spec.homepage      = "https://github.com/guanting112/tw_ubn"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.5.0"

  # spec.metadata["allowed_push_host"] = "Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
