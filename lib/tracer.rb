class Tracer
  attr_reader :path, :data

  def initialize(options = {})
    @options = options
    @trace = build_tracer
    @path = []
    @data = []
  end

  def enable
    @trace.enable
  end

  def disable
    @trace.disable
  end

  private

  def uniq_key
    rand(1..1_000).to_s + Time.now.to_f.to_s
  end

  def build_tracer
    TracePoint.new(:call, :return) do |event|
      next if event.defined_class == self.class

      case event.event
      when :return
        @options[:display_return_value] && event.return_value && @data.push(
          key: uniq_key,
          parent: @path.last,
          text: "Return: #{event.return_value}"
        )
        @path.pop
      when :call
        key = uniq_key
        data = { key: key, parent: @path.last, text: event.method_id }.compact
        @data.push(data)
        @path.push(key)
      end
    end
  end
end
