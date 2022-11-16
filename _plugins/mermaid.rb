module Jekyll
  class Mermaid < Liquid::Block
    def render(context)
      "<div class=\"mermaid\">#{super}</div>"
    end
  end
end

Liquid::Template.register_tag('mermaid', Jekyll::Mermaid)