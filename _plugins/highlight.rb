# Monkey-patch to allow highlighting lines
module Jekyll
  module Tags
    class HighlightBlock
      # override
      def render(context)
        prefix = context["highlighter_prefix"] || ""
        suffix = context["highlighter_suffix"] || ""
        code = super.to_s.gsub(LEADING_OR_TRAILING_LINE_TERMINATORS, "")

        output =
          case context.registers[:site].highlighter
          when "rouge"
            render_rouge(code, context)
          when "pygments"
            render_pygments(code, context)
          else
            render_codehighlighter(code)
          end

        rendered_output = add_code_tag(context, output)
        prefix + rendered_output + suffix
      end

      def render_rouge(code, context)
        require "rouge"
        formatter = Rouge::Formatters::HTMLLineHighlighter.new(
          ::Rouge::Formatters::HTML.new,
          highlight_lines: parse_highlighted_lines(context, @highlight_options[:highlight_lines])
        )
        actual_lang = get_actual_lang(context, code)
        lexer = ::Rouge::Lexer.find_fancy(actual_lang, code) || Rouge::Lexers::PlainText
        formatter.format(lexer.lex(code))
      end

      private

      def to_str_highlight(thing)
        return thing.join(" ") if thing.kind_of?(Array)
        return thing.to_s
      end

      def is_non_digit(str)
        # puts "#{str}".chomp.scan(/[^0-9 ]/)
        "#{str}".chomp.scan(/[^0-9 ]/).any? && !str.empty?
      end

      def to_int_arr(str)
        str.split.map(&:to_i)
      end

      def parse_highlighted_lines(context, lines_string)
        lines_string = to_str_highlight(lines_string)
        # puts "'#{lines_string}' #{is_non_digit(lines_string)}"
        return [] if lines_string.nil?
        if is_non_digit(lines_string) then
          # puts "=> '#{context[lines_string]}' #{is_non_digit(context[lines_string])}"
          lines_string = context[lines_string]
        end
        # puts "'#{lines_string}' #{is_non_digit(lines_string)}"
        return [] if lines_string.nil? || is_non_digit(lines_string)

        to_int_arr(lines_string)
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
    end
  end
end