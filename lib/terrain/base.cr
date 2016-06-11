module Terrain
  class Base

    def initialize
    end

    def symbol
      raise "Sub-class must implement #symbol."
    end

    def color
      raise "Sub-class must implement #color."
    end

    def style
      [] of Symbol
    end

    def name
      self.class.name.split("::").last
    end

    # Returns the symbol wrapped in ANSI color codes
    def to_s
      str = symbol.colorize.fore(color[:fore]).back(color[:back])

      style.each { |style_sym| str.mode(style_sym) }

      str.to_s
    end
  end
end
