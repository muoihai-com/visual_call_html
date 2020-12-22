Gem::Specification.new do |s|
  s.name        = 'visual_call_html'
  s.version     = '0.0.3'
  s.date        = '2020-12-22'
  s.licenses    = ['MIT']
  s.summary     = "This gem helps you see all the other methods called by another method."
  s.description = "Uses the TracePoint class & GoJS to generate a visual representation of all the methods called by another method."
  s.authors     = ["hungkieu"]
  s.email       = 'hungkieu.h12@gmail.com'
  s.files       = Dir["lib/*.rb"]
  s.homepage    = 'https://github.com/muoihai-com/visual_call_html'
end
