module Jekyll
  class LexersTag < Liquid::Tag
    def initialize(tag_name, arg, tokens)
      super
    end

    def render(context)
      context.registers[:page]["lexers"] = get_lexers()

      ""
    end

    private

    def get_lexers()
      Rouge::Lexer.all.map { |lexer|
        {
          "name" => lexer.title,
          "key" => [lexer.tag].concat(lexer.aliases || [])
        }
      }
    end
  end
end

Liquid::Template.register_tag('dump_lexers', Jekyll::LexersTag)