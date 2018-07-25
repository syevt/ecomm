ECOMM_ROOT = File.dirname(File.dirname(File.dirname(__FILE__)))

Dir[File.join(
  ECOMM_ROOT, 'spec', 'factories', 'shareable', '**', '*.rb'
)].each { |file| require(file) }
