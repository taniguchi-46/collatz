# frozen_string_literal: true

require_relative "lib/collatz/version"

Gem::Specification.new do |spec|
  spec.name = "collatz"
  spec.version = Collatz::VERSION
  spec.authors = ["ISHIKAWA"]
  spec.email = ["ishikawa@i-seifu.jp"]

  spec.summary = "Collatz sequence utilities"
  spec.description = "A Ruby gem for generating, inspecting, and analyzing Collatz sequences."
  spec.homepage = "https://github.com/seifu-ishikawa/collatz"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore .rspec spec/ .rubocop.yml])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "unicode_plot", "0.0.4"
end
