lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "Bigger Hello World"
  spec.version       = '1.0'
  spec.authors       = ["Your Name Here"]
  spec.email         = ["youremail@yourdomain.com"]
  spec.summary       = %q{Short summary of your project}
  spec.description   = %q{Longer description of your project.}
  spec.homepage      = "http://domainforproject.com/"
  spec.license       = "GNU GENERAL PUBLIC LICENSE"

  spec.files         = ['lib/BiggerHelloWorld.rb']
  spec.executables   = ['bin/BiggerHelloWorld']
  spec.test_files    = ['tests/test_BiggerHelloWorld.rb']
  spec.require_paths = ["lib"]
end