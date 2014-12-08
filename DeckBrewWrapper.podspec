Pod::Spec.new do |s|
  s.name             = "DeckBrewWrapper"
  s.version          = "0.1.0"
  s.summary          = "DeckBrew Wrapper is an Objective-C client/wrapper for Deck Brew."
  s.description      = <<-DESC
                       DeckBrew Wrapper is an Objective-C client/wrapper for Deck Brew, a Magic the Gathering API. It consists of an API wrapper, responsible for the network calls (``DBAPIWrapper``), requests classes (subclasses of the ``DBRequest`` class), and classes for cards and card sets (``DBCard``, ``DBCardEdition``, and ``DBCardSet``).
                       DESC
  s.homepage         = "https://github.com/otaviocc/DeckBrewWrapper"
  s.license          = 'MIT'
  s.author           = { "Otavio Cordeiro" => "contact@otaviocc.com" }
  s.source           = { :git => "https://github.com/otaviocc/DeckBrewWrapper.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/otaviocc'

  s.platform     = :ios, '7.0'
  s.requires_arc = true
  
  s.source_files = 'DeckBrew/DB*.[h,m]', 'DeckBrew/DeckBrewWrapper.h'

  s.dependency 'AFNetworking', '~> 2.4'
end
