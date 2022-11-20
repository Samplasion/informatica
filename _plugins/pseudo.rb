require "rouge"
class Pseudocode < Rouge::RegexLexer
  title "Pseudocodice"
  desc "La variante di pseudocodice descritta dal libro \"Informatica App\""

  tag 'pseudocodice'
  aliases 'pseudo', 'pseudocode'

  def self.literals
    @literals ||= ['vero', 'falso']
  end

  def self.introductory
    @introductory ||= ['(?:sotto)?algoritmo', 'funzione', 'procedura', 'tipo']
  end

  def self.classes
    @classes ||= ['intero', 'reale', 'classe', 'costante',
                  'booleano', 'array', 'stringa']
  end

  def self.handler_params
    @handler_params ||= ['di', "da", '(?:indietro\s+)?a', 'ref', 'val']
  end

  def self.commands
    @commands ||= ['scrivi', 'leggi']
  end

  def self.operators
    @operators ||= ["and", "or", "not", 'div']
  end

  def self.controls
    @controls ||= ['per', 'mentre', 'ripeti', 'finch(?:é|e)',
            'inizio', 'fine\w*', 'ritorno', 'esegui', 'se',
            'allora', 'altrimenti', 'variabili', 'record']
  end

  operators = %r(\b(#{self.operators.to_a.join('|')})\b)i
  classes = %r(\b(#{self.classes.to_a.join('|')})\b)i
  literals = %r(\b(#{self.literals.to_a.join('|')})\b)i
  introductory = self.introductory
  commands = %r(\b(#{self.commands.to_a.join('|')})\b)i
  controls = %r(\b(#{self.controls.to_a.join('|')})\b)i
  handler_params = %r(\b(#{self.handler_params.to_a.join('|')})\b)i

  state :root do
    rule %r/\s+/, Text::Whitespace
    rule %r/¬\n/, Literal::String::Escape
    rule %r/'s\s+/, Text
    rule %r/(\/\/|#).*?$/, Comment::Single
    rule %r/\(\*/, Comment::Multiline
    rule %r/[\(\){}!,.:\[\]]/, Punctuation
    rule %r/(-|\*|\+|&|≠|>=?|<=?|=|≥|≤|\/|÷|\^)/, Operator
    rule operators, Operator::Word
    rule %r/^(?:\s*)(#{introductory.to_a.join('|')})([\w \t]+)/i do |match|
      # puts "0 => '#{match[0]}'"
      # puts "1 => '#{match[1]}'"
      # puts "2 => '#{match[2]}'"
      # puts "3 => '#{match[3]}'"
      token Keyword::Declaration, match[1]
      token Name::Function, match[2]
    end
    # rule %r/^(\s*)#{introductory}(\s+)/ do |match|
    #   token Text, match[1]
    #   token Keyword, match[2]
    #   token Text, match[3]
    # end
    rule classes, Name::Class
    rule literals, Name::Builtin
    rule commands, Name::Builtin
    rule controls, Keyword
    # rule declarations, Keyword
    rule handler_params, Name::Builtin
    rule %r/"(\\\\|\\"|[^"])*"/, Literal::String::Double
    # rule identifiers, Name::Variable
    rule %r/[-+]?(\d+\.\d*|\d*\.\d+)(E[-+][0-9]+)?/, Literal::Number::Float
    rule %r/[-+]?\d+/, Literal::Number::Integer
    rule %r/\b\S+\b/, Name
  end
end

Jekyll::Hooks.register :site, :pre_render do |site|
  puts "  Pseudocode lexer: generating..."
  
end