require 'json'

class Html
  def initialize data
    @data = data.to_json
  end

  def print
    File.write("#{Dir.pwd}/docx.html", doc)
  end

  private

  def doc
    <<-HTML
      <!DOCTYPE html>
      <html>
      <head>
        <script src="https://cdn.jsdelivr.net/npm/gojs/release/go.js">
        </script>
        <style>
          * {
            margin: 0;
            padding: 0;
          }
          html, body, #myDiagramDiv {
            width: 100%;
            height: 100%;
          }
          body {
            overflow: hidden;
          }
        </style>
      </head>
        <body>
          <div id="myDiagramDiv"></div>
          <script>
            var $ = go.GraphObject.make;
            var myDiagram =
              $(go.Diagram, "myDiagramDiv",
                {
                  "undoManager.isEnabled": true,
                  layout: $(go.TreeLayout, // specify a Diagram.layout that arranges trees
                            { angle: 90, layerSpacing: 35 })
                });

            // the template we defined earlier
            myDiagram.nodeTemplate =
              $(go.Node, "Horizontal",
                { background: "#44CCFF" },
                $(go.TextBlock, "Default Text",
                  { margin: 12, stroke: "white", font: "bold 16px sans-serif" },
                  new go.Binding("text", "text"))
              );

            var model = $(go.TreeModel);
            model.nodeDataArray = JSON.parse('#{@data}')
            myDiagram.model = model;
          </script>
        </body>
      </html>
    HTML
  end
end
