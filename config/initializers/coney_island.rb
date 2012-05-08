unless defined? ON_CONEY_ISLAND
  #This allows us to parse model files that have references to ConeyIsland when we're not on ConeyIsland.
  #The class and its methods would never actually be called in this case, but the parser wants them to be valid.

  class FakeLogger
    def self.info(msg)
    end

    def self.error(msg)
    end
  end

  class ConeyIsland
    def self.logger
      FakeLogger
    end
  end
end