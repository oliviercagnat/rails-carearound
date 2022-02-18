require 'deepl'

class DeepL
  def initialize
    self.configure { |config| config.auth_key = ENV[DEEPL_AUTH_KEY] }
  end
end
