# spec/support/carrierwave.rb
require 'carrierwave/test/matchers'

RSpec.configure do |config|
  config.include CarrierWave::Test::Matchers

  config.before(:suite) do
    CarrierWave.configure do |carrierwave_config|
      carrierwave_config.storage = :file
      carrierwave_config.enable_processing = false
    end
  end

  config.after(:suite) do
    CarrierWave.clean_cached_files!(0)
  end
end
