module Jekyll
  module Tags
    class HighlightBlock
      def render(context)
        prefix = context["highlighter_prefix"] || ""
        suffix = context["highlighter_suffix"] || ""
        code = super.to_s.gsub(LEADING_OR_TRAILING_LINE_TERMINATORS, "")

        output =
          case context.registers[:site].highlighter
          when "rouge"
            render_rouge(context, code)
          when "pygments"
            render_pygments(code, context)
          else
            render_codehighlighter(code)
          end

        rendered_output = add_code_tag(context, output)
        prefix + rendered_output + suffix
      end

      private

      def render_rouge(context, code)
        require "rouge"
        formatter = Rouge::Formatters::HTML.new
        formatter = line_highlighter_formatter(context, formatter) if @highlight_options[:mark_lines]
        formatter = table_formatter(formatter) if @highlight_options[:linenos]

        actual_lang = get_actual_lang(context, code)
        lexer = Rouge::Lexer.find_fancy(actual_lang, code) || Rouge::Lexers::PlainText
        formatter.format(lexer.lex(code))
      end

      def get_actual_lang(context, code)
        return context[@lang] if !context[@lang].nil? && !::Rouge::Lexer.find_fancy(context[@lang], code).nil?

        @lang
      end

      def add_code_tag(context, code)
        actual_lang = get_actual_lang(context, code)
        code_attrs = %(class="language-#{actual_lang.tr("+", "-")}" data-lang="#{actual_lang}")
        %(<figure class="highlight"><pre><code #{code_attrs}>#{code.chomp}</code></pre></figure>)
      end

      def line_highlighter_formatter(context, formatter)
        Rouge::Formatters::HTMLLineHighlighter.new(
          formatter,
          :highlight_lines => mark_lines(context)
        )
      end

      def mark_lines(context)
        value = @highlight_options[:mark_lines]
        return value.map(&:to_i) if value.is_a?(Array)
        # puts "> #{context[value] || "nil"} {context[#{value}]}"
        # puts "=> #{context[value].split.map(&:to_i).map(&:to_i)}" if context[value] != nil
        if context[value] != nil
          return context[value].split.map(&:to_i).map(&:to_i)
        else
          return []
        end
      
        raise SyntaxError, "Syntax Error for mark_lines declaration. Expected a " \
                           "double-quoted list of integers, or a variable referring " \
                           "to it."
      end

      def table_formatter(formatter)
        Rouge::Formatters::HTMLTable.new(
          formatter,
          :css_class    => "highlight",
          :gutter_class => "gutter",
          :code_class   => "code"
        )
      end
    end
  end
end