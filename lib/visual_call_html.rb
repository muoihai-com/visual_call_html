require_relative 'tracer'
require_relative 'html'

module VisualCallHtml
  class << self
    def trace
      return unless block_given?

      tracer = Tracer.new
      tracer.enable
      yield
      tracer.disable

      Html.new(tracer.data).print
    end
  end
end
