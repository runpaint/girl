# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{girl}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Run Paint Run Run"]
  s.date = %q{2009-04-28}
  s.default_executable = %q{girl}
  s.email = %q{runrun@runpaint.org}
  s.executables = ["girl"]
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "bin/girl",
    "lib/girl.rb",
    "spec/girl/new_spec.rb",
    "spec/girl/pearl_spec.rb",
    "spec/girl/pearls_spec.rb",
    "spec/girl/show_spec.rb",
    "spec/girl_spec.rb",
    "spec/pearl/exists_spec.rb",
    "spec/pearl/filename_spec.rb",
    "spec/pearl/new_spec.rb",
    "spec/pearl/text_spec.rb",
    "spec/renderer/pager/new_spec.rb",
    "spec/renderer/pager/pick_pager_spec.rb",
    "spec/renderer/pager/render_spec.rb",
    "spec/spec.opts",
    "spec/spec_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/runpaint/girl}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{The younger, prettier alternative to `man`.}
  s.test_files = [
    "spec/girl/new_spec.rb",
    "spec/girl/pearls_spec.rb",
    "spec/girl/show_spec.rb",
    "spec/girl/pearl_spec.rb",
    "spec/renderer/pager/new_spec.rb",
    "spec/renderer/pager/pick_pager_spec.rb",
    "spec/renderer/pager/render_spec.rb",
    "spec/pearl/new_spec.rb",
    "spec/pearl/exists_spec.rb",
    "spec/pearl/filename_spec.rb",
    "spec/pearl/text_spec.rb",
    "spec/girl_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<runpaint-terminal-size>, [">= 0.1.1"])
      s.add_runtime_dependency(%q<text-highlight>, [">= 1.0.2"])
    else
      s.add_dependency(%q<runpaint-terminal-size>, [">= 0.1.1"])
      s.add_dependency(%q<text-highlight>, [">= 1.0.2"])
    end
  else
    s.add_dependency(%q<runpaint-terminal-size>, [">= 0.1.1"])
    s.add_dependency(%q<text-highlight>, [">= 1.0.2"])
  end
end
