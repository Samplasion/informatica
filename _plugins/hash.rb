module Jekyll
  module HashFilter
    def hash(input)
      input.to_s.hash
    end
  end
end

Liquid::Template.register_filter(Jekyll::HashFilter)