module Jekyll
  module UnquoteFilter
    def unquote(input)
      input[1...-1]
    end
  end
end

Liquid::Template.register_filter(Jekyll::UnquoteFilter)