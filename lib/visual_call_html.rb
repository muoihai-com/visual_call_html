require_relative 'tracer'
require_relative 'html'

module VisualCallHtml
  class << self
    def trace(options = {})
      return unless block_given?

      tracer = Tracer.new(options)
      tracer.enable
      yield
      tracer.disable

      Html.new(tracer.data).print
    end
  end
end
