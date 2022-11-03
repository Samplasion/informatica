def html(input, classes = "")
  "<i class=\"fa fa-#{input} #{classes}\" aria-hidden=\"true\"></i>"
end

module Jekyll
  module FontAwesomeFilter
    def fa(input)
      html(input)
    end

    def fw(input)
      html(input, "fa-fw")
    end
  end
end

Liquid::Template.register_filter(Jekyll::FontAwesomeFilter)