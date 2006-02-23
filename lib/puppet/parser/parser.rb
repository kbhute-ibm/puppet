#
# DO NOT MODIFY!!!!
# This file is automatically generated by racc 1.4.5
# from racc grammer file "grammar.ra".
#

require 'racc/parser'


require 'puppet'
require 'puppet/parsedfile'
require 'puppet/parser/lexer'
require 'puppet/parser/ast'
#require 'puppet/parser/interpreter'

module Puppet
    class ParseError < Puppet::Error; end

    class ImportError < Racc::ParseError; end
end

Puppet[:typecheck] = true
Puppet[:paramcheck] = true


module Puppet

  module Parser

    class Parser < Racc::Parser

module_eval <<'..end grammar.ra modeval..id352a7e96a4', 'grammar.ra', 718
attr_reader :file
attr_accessor :files

# Create an AST array out of all of the args
def aryfy(*args)
    if args[0].instance_of?(AST::ASTArray)
        result = args.shift
        args.each { |arg|
            result.push arg
        }
    else
        result = AST::ASTArray.new(
            :children => args
        )
    end

    return result
end

def file=(file)
    unless FileTest.exists?(file)
        raise Puppet::Error, "Could not find file %s" % file
    end
    if @files.detect { |f| f.file == file }
        raise Puppet::ImportError.new("Import loop detected")
    else
        @files << Puppet::ParsedFile.new(file)
        @lexer.file = file
    end
end

def initialize
    @lexer = Puppet::Parser::Lexer.new()
    @files = []
    #if Puppet[:debug]
    #    @yydebug = true
    #end
end

def on_error(token,value,stack)
    #on '%s' at '%s' in\n'%s'" % [token,value,stack]
    #error = "line %s: parse error after '%s'" %
    #    [@lexer.line,@lexer.last]
    error = "Syntax error at '%s'" % [value]

    #if Puppet[:debug]
        #puts stack.inspect
        #puts stack.class
    #end
    #if @lexer.file
    #    error += (" in '%s'" % @lexer.file)
    #end

    except = Puppet::ParseError.new(error)
    except.line = @lexer.line
    if @lexer.file
        except.file = @lexer.file
    end

    raise except
end

# how should I do error handling here?
def parse
    begin
        yyparse(@lexer,:scan)
    rescue Racc::ParseError => except
        error = Puppet::ParseError.new(except)
        error.line = @lexer.line
        error.file = @lexer.file
        error.backtrace = except.backtrace
        raise error
    rescue Puppet::ParseError => except
        except.line ||= @lexer.line
        except.file ||= @lexer.file
        raise except
    rescue Puppet::Error => except
        # and this is a framework error
        except.line ||= @lexer.line
        except.file ||= @lexer.file
        #if Puppet[:debug]
        #    puts except.stack
        #end
        raise except
    rescue Puppet::DevError => except
        except.line ||= @lexer.line
        except.file ||= @lexer.file
        #if Puppet[:debug]
        #    puts except.stack
        #end
        raise except
    rescue => except
        error = Puppet::DevError.new(except.message)
        error.line = @lexer.line
        error.file = @lexer.file
        error.backtrace = except.backtrace
        #if Puppet[:debug]
        #    puts caller
        #end
        raise error
    end
end

def reparse?
    @files.detect { |file|
        file.changed?
    }
end

def string=(string)
    @lexer.string = string
end

# $Id$
..end grammar.ra modeval..id352a7e96a4

##### racc 1.4.5 generates ###

racc_reduce_table = [
 0, 0, :racc_error,
 1, 42, :_reduce_1,
 1, 43, :_reduce_none,
 2, 43, :_reduce_3,
 1, 44, :_reduce_none,
 1, 44, :_reduce_none,
 1, 44, :_reduce_none,
 1, 44, :_reduce_none,
 1, 44, :_reduce_none,
 1, 44, :_reduce_none,
 1, 44, :_reduce_none,
 1, 44, :_reduce_none,
 2, 49, :_reduce_12,
 1, 53, :_reduce_none,
 3, 53, :_reduce_14,
 1, 54, :_reduce_none,
 1, 54, :_reduce_none,
 5, 45, :_reduce_17,
 5, 45, :_reduce_18,
 5, 45, :_reduce_19,
 3, 62, :_reduce_20,
 1, 57, :_reduce_none,
 3, 57, :_reduce_22,
 0, 58, :_reduce_none,
 1, 58, :_reduce_none,
 1, 55, :_reduce_25,
 1, 61, :_reduce_26,
 1, 63, :_reduce_none,
 1, 63, :_reduce_none,
 1, 63, :_reduce_none,
 1, 63, :_reduce_none,
 1, 63, :_reduce_none,
 1, 63, :_reduce_none,
 3, 46, :_reduce_33,
 0, 59, :_reduce_34,
 1, 59, :_reduce_35,
 3, 59, :_reduce_36,
 3, 68, :_reduce_37,
 1, 69, :_reduce_none,
 3, 69, :_reduce_39,
 1, 67, :_reduce_none,
 1, 67, :_reduce_none,
 1, 67, :_reduce_none,
 1, 67, :_reduce_none,
 1, 67, :_reduce_none,
 1, 67, :_reduce_none,
 1, 67, :_reduce_none,
 1, 67, :_reduce_none,
 1, 67, :_reduce_none,
 1, 64, :_reduce_49,
 1, 64, :_reduce_50,
 1, 71, :_reduce_51,
 4, 72, :_reduce_52,
 5, 47, :_reduce_53,
 1, 73, :_reduce_none,
 2, 73, :_reduce_55,
 5, 74, :_reduce_56,
 4, 74, :_reduce_57,
 1, 75, :_reduce_none,
 3, 75, :_reduce_59,
 3, 65, :_reduce_60,
 1, 77, :_reduce_none,
 3, 77, :_reduce_62,
 1, 79, :_reduce_none,
 3, 79, :_reduce_64,
 3, 78, :_reduce_65,
 1, 76, :_reduce_66,
 1, 76, :_reduce_67,
 1, 76, :_reduce_none,
 1, 76, :_reduce_69,
 1, 76, :_reduce_none,
 2, 48, :_reduce_71,
 6, 50, :_reduce_72,
 5, 50, :_reduce_73,
 6, 51, :_reduce_74,
 5, 51, :_reduce_75,
 6, 52, :_reduce_76,
 5, 52, :_reduce_77,
 1, 82, :_reduce_none,
 2, 82, :_reduce_79,
 0, 83, :_reduce_80,
 1, 80, :_reduce_none,
 3, 80, :_reduce_82,
 3, 80, :_reduce_83,
 1, 84, :_reduce_none,
 3, 84, :_reduce_85,
 3, 85, :_reduce_86,
 1, 85, :_reduce_87,
 1, 81, :_reduce_none,
 2, 81, :_reduce_89,
 1, 56, :_reduce_90,
 3, 66, :_reduce_91,
 1, 70, :_reduce_none,
 1, 70, :_reduce_none,
 0, 60, :_reduce_none,
 1, 60, :_reduce_95 ]

racc_reduce_n = 96

racc_shift_n = 157

racc_action_table = [
    24,    25,    24,    25,   132,    24,    25,    35,    24,    25,
    77,   105,    35,    24,    25,     7,     7,   129,    24,    25,
     7,   127,    67,    24,    25,    84,    23,   126,   131,    39,
    84,    39,    94,    95,    94,    95,    97,    39,    97,    69,
    94,    95,    39,   112,    97,    94,    95,    39,   113,    97,
    94,    95,    39,   108,    97,    94,    95,   109,   110,    97,
    33,    24,    25,    33,    24,    25,    83,   115,   116,    33,
    24,    25,    78,    77,    33,    24,    25,   119,    73,    33,
    24,    25,   149,    73,   109,   110,    35,    73,   124,    35,
    39,   125,    81,     4,     7,    35,     4,     7,   128,    39,
    35,    42,     4,     7,    39,    35,    69,     4,     7,    39,
    68,   135,     4,     7,    33,    24,    25,    33,    24,    25,
     7,   137,    65,    33,    24,    25,    50,   142,    33,    24,
    25,     7,    88,    33,    24,    25,     7,   146,    43,    87,
    35,    42,    41,    35,    39,    27,    73,     4,     7,    35,
     4,    57,   138,    39,    35,    86,     4,     7,    39,    35,
    23,     4,     7,    39,    86,   nil,     4,     7,   156,   nil,
     6,     9,   nil,    13,    16,   nil,    20,   nil,   nil,   nil,
     4,     7,   nil,    11,   153,    17,     6,     9,   nil,    13,
    16,   nil,    20,   nil,   nil,   nil,     4,     7,   nil,    11,
   140,    17,     6,     9,   nil,    13,    16,   nil,    20,   nil,
   nil,   nil,     4,     7,   nil,    11,   122,    17,     6,     9,
   nil,    13,    16,   nil,    20,   nil,   nil,   nil,     4,     7,
   nil,    11,   152,    17,     6,     9,   nil,    13,    16,   nil,
    20,   nil,   nil,   nil,     4,     7,   nil,    11,   151,    17,
     6,     9,   nil,    13,    16,   nil,    20,   nil,   nil,   nil,
     4,     7,   nil,    11,   143,    17,     6,     9,   nil,    13,
    16,   nil,    20,   nil,   nil,   nil,     4,     7,   nil,    11,
   nil,    17,     6,     9,   nil,    13,    16,   nil,    20,   nil,
   nil,   nil,     4,     7,   nil,    11,   nil,    17,     6,     9,
   nil,    13,    16,   nil,    20,   nil,   nil,   nil,     4,     7,
   nil,    11,   nil,    17,     6,     9,   nil,    13,    16,   nil,
    20,   nil,   nil,   nil,     4,     7,   nil,    11,   nil,    17 ]

racc_action_check = [
    68,    68,   148,   148,   101,     6,     6,    17,    69,    69,
    49,    69,    78,    98,    98,    17,    49,    98,   132,   132,
    78,    91,    29,   105,   105,    57,    29,    91,   101,    68,
    73,   148,    68,    68,   148,   148,    68,    69,   148,    54,
    69,    69,    98,    75,    69,    98,    98,   132,    77,    98,
   132,   132,   105,    71,   132,   105,   105,    71,    71,   105,
   135,   135,   135,    83,    83,    83,    56,    80,    82,    11,
    11,    11,    46,    43,    84,    84,    84,    85,    86,    41,
    41,    41,   134,    87,   134,   134,   135,    42,    89,    83,
   135,    90,    50,   135,   135,    11,    83,    83,    93,    11,
    84,    37,    11,    11,    84,    41,    31,    84,    84,    41,
    30,   106,    41,    41,    67,    67,    67,    23,    23,    23,
    65,   111,    27,    33,    33,    33,    21,   121,   107,   107,
   107,    20,    64,   124,   124,   124,   127,   131,    16,    61,
    67,    14,    13,    23,    67,     9,   142,    67,    67,    33,
    23,    23,   112,    33,   107,    58,    33,    33,   107,   124,
     1,   107,   107,   124,    74,   nil,   124,   124,   154,   nil,
   112,   112,   nil,   112,   112,   nil,   112,   nil,   nil,   nil,
   112,   112,   nil,   112,   146,   112,   154,   154,   nil,   154,
   154,   nil,   154,   nil,   nil,   nil,   154,   154,   nil,   154,
   115,   154,   146,   146,   nil,   146,   146,   nil,   146,   nil,
   nil,   nil,   146,   146,   nil,   146,    88,   146,   115,   115,
   nil,   115,   115,   nil,   115,   nil,   nil,   nil,   115,   115,
   nil,   115,   141,   115,    88,    88,   nil,    88,    88,   nil,
    88,   nil,   nil,   nil,    88,    88,   nil,    88,   139,    88,
   141,   141,   nil,   141,   141,   nil,   141,   nil,   nil,   nil,
   141,   141,   nil,   141,   123,   141,   139,   139,   nil,   139,
   139,   nil,   139,   nil,   nil,   nil,   139,   139,   nil,   139,
   nil,   139,   123,   123,   nil,   123,   123,   nil,   123,   nil,
   nil,   nil,   123,   123,   nil,   123,   nil,   123,    22,    22,
   nil,    22,    22,   nil,    22,   nil,   nil,   nil,    22,    22,
   nil,    22,   nil,    22,     0,     0,   nil,     0,     0,   nil,
     0,   nil,   nil,   nil,     0,     0,   nil,     0,   nil,     0 ]

racc_action_pointer = [
   289,   154,   nil,   nil,   nil,   nil,     2,   nil,   nil,   109,
   nil,    67,   nil,   129,   135,   nil,   102,   -21,   nil,   nil,
    95,   126,   273,   115,   nil,   nil,   nil,   107,   nil,    20,
   104,    92,   nil,   121,   nil,   nil,   nil,    95,   nil,   nil,
   nil,    77,    51,    43,   nil,   nil,    62,   nil,   nil,   -20,
    92,   nil,   nil,   nil,    25,   nil,    29,    16,   145,   nil,
   nil,   105,   nil,   nil,   126,    84,   nil,   112,    -3,     5,
   nil,    48,   nil,    21,   154,    37,   nil,    12,   -16,   nil,
    61,   nil,    61,    61,    72,    70,    42,    47,   209,    75,
    75,    11,   nil,    93,   nil,   nil,   nil,   nil,    10,   nil,
   nil,    -6,   nil,   nil,   nil,    20,   102,   126,   nil,   nil,
   nil,   114,   145,   nil,   nil,   193,   nil,   nil,   nil,   nil,
   nil,   117,   nil,   257,   131,   nil,   nil,   100,   nil,   nil,
   nil,   131,    15,   nil,    75,    58,   nil,   nil,   nil,   241,
   nil,   225,   110,   nil,   nil,   nil,   177,   nil,    -1,   nil,
   nil,   nil,   nil,   nil,   161,   nil,   nil ]

racc_action_default = [
   -96,   -96,    -2,    -4,   -26,    -5,   -96,   -25,    -6,   -96,
    -7,   -96,    -8,   -96,   -96,    -9,   -96,   -96,   -10,   -11,
   -96,   -96,    -1,   -34,   -49,   -50,   -71,   -80,   -47,   -41,
   -96,   -46,   -45,   -96,   -43,   -90,   -48,   -42,   -40,   -51,
   -44,   -96,   -34,   -80,   -15,   -16,   -12,   -13,   -78,   -80,
   -96,    -3,   -32,   -28,   -31,   -35,   -23,   -25,   -94,   -29,
   -21,   -96,   -27,   -30,   -96,   -80,   -81,   -96,   -96,   -96,
   -38,   -96,   -33,   -96,   -94,   -96,   -88,   -96,   -96,   -79,
   -96,   157,   -96,   -24,   -96,   -96,   -95,   -34,   -96,   -87,
   -96,   -96,   -84,   -96,   -67,   -66,   -70,   -69,   -96,   -54,
   -68,   -96,   -58,   -60,   -61,   -96,   -96,   -96,   -91,   -92,
   -93,   -96,   -96,   -89,   -14,   -96,   -17,   -22,   -37,   -18,
   -36,   -20,   -73,   -96,   -96,   -82,   -83,   -96,   -52,   -53,
   -55,   -96,   -96,   -63,   -96,   -96,   -39,   -19,   -75,   -96,
   -77,   -96,   -96,   -72,   -86,   -85,   -96,   -59,   -96,   -62,
   -65,   -74,   -76,   -57,   -96,   -64,   -56 ]

racc_goto_table = [
    22,    26,    51,   107,    58,   120,    99,    96,    96,    37,
   104,    45,   102,    29,    47,    66,   103,    54,    62,    44,
    75,    59,    48,    74,    56,    53,    80,    98,    30,    92,
    60,    37,    52,    85,    63,    29,   130,    96,    46,    37,
    32,   134,   102,    29,    96,    64,   133,    82,    49,   111,
    70,    79,    71,    90,    91,    21,   nil,   nil,    72,   nil,
   nil,   120,    32,   100,   100,    37,   148,    89,   121,    29,
    32,    96,    45,   nil,   nil,   114,   147,    54,    62,   nil,
    44,    59,    37,   nil,    93,    53,    29,    96,   123,   155,
   117,   145,    52,   100,    63,   nil,    32,   nil,   nil,   nil,
   100,   118,   nil,    51,   nil,    37,   nil,   nil,   nil,    29,
   nil,   nil,   139,    32,   nil,   141,   nil,   nil,   nil,    51,
   nil,    51,    37,   nil,   136,   nil,    29,   100,   nil,    89,
   nil,   nil,   nil,    37,    51,   nil,    32,    29,   nil,   nil,
   nil,   144,   nil,   100,   nil,   nil,   154,   nil,   nil,   nil,
   nil,   nil,   150,    32,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,    32 ]

racc_goto_check = [
     2,    23,     3,    29,    18,    27,    33,    30,    30,    20,
    37,    15,    35,    14,    13,    42,    36,    15,    23,    14,
    40,    20,    14,    18,    16,    14,    40,    32,    26,    44,
    21,    20,    25,    19,    24,    14,    33,    30,    12,    20,
     4,    38,    35,    14,    30,    39,    37,    17,    41,    19,
    26,    14,    28,    42,    43,     1,   nil,   nil,    26,   nil,
   nil,    27,     4,    23,    23,    20,    29,    14,    18,    14,
     4,    30,    15,   nil,   nil,    13,    35,    15,    23,   nil,
    14,    20,    20,   nil,    26,    14,    14,    30,     2,    37,
    21,    44,    25,    23,    24,   nil,     4,   nil,   nil,   nil,
    23,    26,   nil,     3,   nil,    20,   nil,   nil,   nil,    14,
   nil,   nil,     2,     4,   nil,     2,   nil,   nil,   nil,     3,
   nil,     3,    20,   nil,    26,   nil,    14,    23,   nil,    14,
   nil,   nil,   nil,    20,     3,   nil,     4,    14,   nil,   nil,
   nil,    26,   nil,    23,   nil,   nil,     2,   nil,   nil,   nil,
   nil,   nil,    26,     4,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,     4 ]

racc_goto_pointer = [
   nil,    55,     0,   -20,    29,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,    21,    -3,     2,    -6,     1,    -9,   -19,   -25,
    -2,     7,   nil,    -5,    11,     9,    17,   -81,    19,   -68,
   -61,   nil,   -41,   -62,   nil,   -56,   -53,   -59,   -64,    18,
   -23,    28,   -12,   -11,   -36 ]

racc_goto_default = [
   nil,   nil,   nil,     2,     3,     5,     8,    10,    12,    15,
    18,    19,   nil,   nil,     1,    31,   nil,   nil,   nil,   nil,
    14,   nil,    61,    38,    40,    28,   nil,    55,   nil,   nil,
    34,    36,   nil,   nil,   101,   106,   nil,   nil,   nil,   nil,
   nil,   nil,    76,   nil,   nil ]

racc_token_table = {
 false => 0,
 Object.new => 1,
 :LBRACK => 2,
 :DQTEXT => 3,
 :SQTEXT => 4,
 :RBRACK => 5,
 :LBRACE => 6,
 :RBRACE => 7,
 :SYMBOL => 8,
 :FARROW => 9,
 :COMMA => 10,
 :TRUE => 11,
 :FALSE => 12,
 :EQUALS => 13,
 :QMARK => 14,
 :LPAREN => 15,
 :RPAREN => 16,
 :ISEQUAL => 17,
 :GREATEREQUAL => 18,
 :GREATERTHAN => 19,
 :LESSTHAN => 20,
 :LESSEQUAL => 21,
 :NOTEQUAL => 22,
 :IF => 23,
 :ELSE => 24,
 :IMPORT => 25,
 :DEFINE => 26,
 :ELSIF => 27,
 :VARIABLE => 28,
 :CLASS => 29,
 :INHERITS => 30,
 :NODE => 31,
 :BOOLEAN => 32,
 :DOT => 33,
 :COLON => 34,
 :TYPE => 35,
 :NAME => 36,
 :SEMIC => 37,
 :CASE => 38,
 :DEFAULT => 39,
 :INCLUDE => 40 }

racc_use_result_var = true

racc_nt_base = 41

Racc_arg = [
 racc_action_table,
 racc_action_check,
 racc_action_default,
 racc_action_pointer,
 racc_goto_table,
 racc_goto_check,
 racc_goto_default,
 racc_goto_pointer,
 racc_nt_base,
 racc_reduce_table,
 racc_token_table,
 racc_shift_n,
 racc_reduce_n,
 racc_use_result_var ]

Racc_token_to_s_table = [
'$end',
'error',
'LBRACK',
'DQTEXT',
'SQTEXT',
'RBRACK',
'LBRACE',
'RBRACE',
'SYMBOL',
'FARROW',
'COMMA',
'TRUE',
'FALSE',
'EQUALS',
'QMARK',
'LPAREN',
'RPAREN',
'ISEQUAL',
'GREATEREQUAL',
'GREATERTHAN',
'LESSTHAN',
'LESSEQUAL',
'NOTEQUAL',
'IF',
'ELSE',
'IMPORT',
'DEFINE',
'ELSIF',
'VARIABLE',
'CLASS',
'INHERITS',
'NODE',
'BOOLEAN',
'DOT',
'COLON',
'TYPE',
'NAME',
'SEMIC',
'CASE',
'DEFAULT',
'INCLUDE',
'$start',
'program',
'statements',
'statement',
'object',
'assignment',
'casestatement',
'import',
'include',
'definition',
'hostclass',
'nodedef',
'classnames',
'classname',
'name',
'variable',
'objectinstances',
'endsemi',
'params',
'endcomma',
'type',
'objectinst',
'objectname',
'quotedtext',
'selector',
'array',
'rvalue',
'param',
'rvalues',
'comma',
'boolean',
'objectref',
'caseopts',
'caseopt',
'casevalues',
'selectlhand',
'svalues',
'selectval',
'sintvalues',
'argumentlist',
'parent',
'names',
'nothing',
'arguments',
'argument']

Racc_debug_parser = false

##### racc system variables end #####

 # reduce 0 omitted

module_eval <<'.,.,', 'grammar.ra', 37
  def _reduce_1( val, _values, result )
    if val[0].is_a?(AST::ASTArray)
        result = val[0]
    else
        result = AST::ASTArray.new(
            :line => @lexer.line,
            :children => [val[0]]
        )
    end

    # this is mainly so we can test the parser separately from the
    # interpreter
#    if Puppet[:parseonly]
#        begin
#            if Puppet[:debug]
#                puts result.tree(0)
#            end
#        rescue NoMethodError => detail
#            Puppet.err detail
#            #exit(78)
#        end
#        #require 'puppet/parser/interpreter'
#        #result = Puppet::Server.new(result)
#    end
   result
  end
.,.,

 # reduce 2 omitted

module_eval <<'.,.,', 'grammar.ra', 51
  def _reduce_3( val, _values, result )
    if val[0].instance_of?(AST::ASTArray)
        val[0].push(val[1])
        result = val[0]
    else
        result = AST::ASTArray.new(
            :file => @lexer.file,
            :line => @lexer.line,
            :children => [val[0],val[1]]
        )
    end
   result
  end
.,.,

 # reduce 4 omitted

 # reduce 5 omitted

 # reduce 6 omitted

 # reduce 7 omitted

 # reduce 8 omitted

 # reduce 9 omitted

 # reduce 10 omitted

 # reduce 11 omitted

module_eval <<'.,.,', 'grammar.ra', 88
  def _reduce_12( val, _values, result )
    classnames = aryfy(val[1])

    klasses = []
    
    # Now just iterate over each of the class names and create a new
    # object instance.  FIXME This should probably eventually include
    # some kind of checking that the asked-for class is a defined class.
    classnames.each { |classname|
        emptyary = AST::ASTArray.new(:children => [])
        klasses << AST::ObjectDef.new(
            :pin => "{}",
            :line => @lexer.line,
            :file => @lexer.file,
            :type => classname,
            :params => emptyary
        )
    }
    result = AST::ASTArray.new(
        :line => @lexer.line,
        :file => @lexer.file,
        :children => klasses
    )
   result
  end
.,.,

 # reduce 13 omitted

module_eval <<'.,.,', 'grammar.ra', 95
  def _reduce_14( val, _values, result )
    result = aryfy(val[0], val[2])
    result.line = @lexer.line
    result.file = @lexer.file
   result
  end
.,.,

 # reduce 15 omitted

 # reduce 16 omitted

module_eval <<'.,.,', 'grammar.ra', 129
  def _reduce_17( val, _values, result )
    if val[0].instance_of?(AST::ASTArray)
        raise Puppet::ParseError, "Invalid name"
    end
    array = val[2]
    if array.instance_of?(AST::ObjectInst)
        array = [array]
    end
    result = AST::ASTArray.new(
        :line => @lexer.line,
        :file => @lexer.file
    )
    # this iterates across each specified objectinstance
    array.each { |instance|
        unless instance.instance_of?(AST::ObjectInst)
            raise Puppet::Dev, "Got something that isn't an instance"
        end
        # now, i need to somehow differentiate between those things with
        # arrays in their names, and normal things
        result.push AST::ObjectDef.new(
            :pin => "{}",
            :line => @lexer.line,
            :file => @lexer.file,
            :type => val[0],
            :name => instance[0],
            :params => instance[1]
        )
    }
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 145
  def _reduce_18( val, _values, result )
    if val[0].instance_of?(AST::ASTArray)
        Puppet.notice "invalid name"
        raise Puppet::ParseError, "Invalid name"
    end
    # an object but without a name
    # this cannot be an instance of a library type

    # the objects will autogenerate a name if we don't provide one
    result = AST::ObjectDef.new(
        :pin => "{}",
        :line => @lexer.line,
        :file => @lexer.file,
        :type => val[0],
        :params => val[2]
    )
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 157
  def _reduce_19( val, _values, result )
    # a template setting for a type
    if val[0].instance_of?(AST::ASTArray)
        raise Puppet::ParseError, "Invalid type"
    end
    result = AST::TypeDefaults.new(
        :pin => "{}",
        :line => @lexer.line,
        :file => @lexer.file,
        :type => val[0],
        :params => val[2]
    )
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 165
  def _reduce_20( val, _values, result )
    result = AST::ObjectInst.new(
        :line => @lexer.line,
        :file => @lexer.file,
        :children => [val[0],val[2]]
    )
   result
  end
.,.,

 # reduce 21 omitted

module_eval <<'.,.,', 'grammar.ra', 179
  def _reduce_22( val, _values, result )
    if val[0].instance_of?(AST::ObjectInst)
        result = AST::ASTArray.new(
            :line => @lexer.line,
            :file => @lexer.file,
            :children => [val[0],val[2]]
        )
    else
        val[0].push val[2]
        result = val[0]
    end
   result
  end
.,.,

 # reduce 23 omitted

 # reduce 24 omitted

module_eval <<'.,.,', 'grammar.ra', 190
  def _reduce_25( val, _values, result )
    result = AST::Name.new(
        :line => @lexer.line,
        :file => @lexer.file,
        :value => val[0]
    )
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 198
  def _reduce_26( val, _values, result )
    result = AST::Type.new(
        :line => @lexer.line,
        :file => @lexer.file,
        :value => val[0]
    )
   result
  end
.,.,

 # reduce 27 omitted

 # reduce 28 omitted

 # reduce 29 omitted

 # reduce 30 omitted

 # reduce 31 omitted

 # reduce 32 omitted

module_eval <<'.,.,', 'grammar.ra', 221
  def _reduce_33( val, _values, result )
    # this is distinct from referencing a variable
    variable = AST::Name.new(
        :line => @lexer.line,
        :file => @lexer.file,
        :value => val[0].sub(/^\$/,'')
    )
    result = AST::VarDef.new(
        :pin => "=",
        :line => @lexer.line,
        :file => @lexer.file,
        :name => variable,
        :value => val[2]
    )
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 230
  def _reduce_34( val, _values, result )
    result = AST::ASTArray.new(
        :line => @lexer.line,
        :file => @lexer.file,
        :children => []
    )
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 230
  def _reduce_35( val, _values, result )
 result = val[0]
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 243
  def _reduce_36( val, _values, result )
    if val[0].instance_of?(AST::ASTArray)
        val[0].push(val[2])
        result = val[0]
    else
        result = AST::ASTArray.new(
            :line => @lexer.line,
            :file => @lexer.file,
            :children => [val[0],val[2]]
        )
    end
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 258
  def _reduce_37( val, _values, result )
    leaf = AST::String.new(
        :line => @lexer.line,
        :file => @lexer.file,
        :value => val[0]
    )
    result = AST::ObjectParam.new(
        :pin => "=>",
        :line => @lexer.line,
        :file => @lexer.file,
        :param => leaf,
        :value => val[2]
    )
   result
  end
.,.,

 # reduce 38 omitted

module_eval <<'.,.,', 'grammar.ra', 271
  def _reduce_39( val, _values, result )
    if val[0].instance_of?(AST::ASTArray)
        result = val[0].push(val[2])
    else
        result = AST::ASTArray.new(
            :line => @lexer.line,
            :file => @lexer.file,
            :children => [val[0],val[2]]
        )
    end
   result
  end
.,.,

 # reduce 40 omitted

 # reduce 41 omitted

 # reduce 42 omitted

 # reduce 43 omitted

 # reduce 44 omitted

 # reduce 45 omitted

 # reduce 46 omitted

 # reduce 47 omitted

 # reduce 48 omitted

module_eval <<'.,.,', 'grammar.ra', 289
  def _reduce_49( val, _values, result )
    result = AST::String.new(
        :line => @lexer.line,
        :file => @lexer.file,
        :value => val[0]
    )
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 295
  def _reduce_50( val, _values, result )
    result = AST::FlatString.new(
        :line => @lexer.line,
        :file => @lexer.file,
        :value => val[0]
    )
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 303
  def _reduce_51( val, _values, result )
    result = AST::Boolean.new(
        :line => @lexer.line,
        :file => @lexer.file,
        :value => val[0]
    )
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 313
  def _reduce_52( val, _values, result )
    result = AST::ObjectRef.new(
        :pin => '[]',
        :line => @lexer.line,
        :file => @lexer.file,
        :type => val[0],
        :name => val[2]
    )
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 330
  def _reduce_53( val, _values, result )
    options = val[3]
    unless options.instance_of?(AST::ASTArray)
        options = AST::ASTArray.new(
            :line => @lexer.line,
            :file => @lexer.file,
            :children => [val[3]]
        )
    end
    result = AST::CaseStatement.new(
        :test => val[1],
        :options => options,
        :file => @lexer.file,
        :line => @lexer.line
    )
   result
  end
.,.,

 # reduce 54 omitted

module_eval <<'.,.,', 'grammar.ra', 344
  def _reduce_55( val, _values, result )
    if val[0].instance_of?(AST::ASTArray)
        val[0].push val[1]
        result = val[0]
    else
        result = AST::ASTArray.new(
            :line => @lexer.line,
            :file => @lexer.file,
            :children => [val[0], val[1]]
        )
    end
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 354
  def _reduce_56( val, _values, result )
    result = AST::CaseOpt.new(
        :pin => ":",
        :value => val[0],
        :file => @lexer.file,
        :line => @lexer.line,
        :statements => val[3]
    )
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 366
  def _reduce_57( val, _values, result )
    result = AST::CaseOpt.new(
        :pin => ":",
        :value => val[0],
        :file => @lexer.file,
        :line => @lexer.line,
        :statements => AST::ASTArray.new(
            :line => @lexer.line,
            :file => @lexer.file,
            :children => []
        )
    )
   result
  end
.,.,

 # reduce 58 omitted

module_eval <<'.,.,', 'grammar.ra', 380
  def _reduce_59( val, _values, result )
    if val[0].instance_of?(AST::ASTArray)
        val[0].push(val[2])
        result = val[0]
    else
        result = AST::ASTArray.new(
            :line => @lexer.line,
            :file => @lexer.file,
            :children => [val[0],val[2]]
        )
    end
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 390
  def _reduce_60( val, _values, result )
    result = AST::Selector.new(
        :pin => "?",
        :line => @lexer.line,
        :file => @lexer.file,
        :param => val[0],
        :values => val[2]
    )
   result
  end
.,.,

 # reduce 61 omitted

module_eval <<'.,.,', 'grammar.ra', 392
  def _reduce_62( val, _values, result )
 result = val[1]
   result
  end
.,.,

 # reduce 63 omitted

module_eval <<'.,.,', 'grammar.ra', 407
  def _reduce_64( val, _values, result )
    if val[0].instance_of?(AST::ASTArray)
        val[0].push(val[2])
        result = val[0]
    else
        result = AST::ASTArray.new(
            :line => @lexer.line,
            :file => @lexer.file,
            :children => [val[0],val[2]]
        )
    end
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 417
  def _reduce_65( val, _values, result )
    result = AST::ObjectParam.new(
        :pin => "=>",
        :line => @lexer.line,
        :file => @lexer.file,
        :param => val[0],
        :value => val[2]
    )
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 425
  def _reduce_66( val, _values, result )
    result = AST::String.new(
        :line => @lexer.line,
        :file => @lexer.file,
        :value => val[0]
    )
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 432
  def _reduce_67( val, _values, result )
    result = AST::String.new(
        :line => @lexer.line,
        :file => @lexer.file,
        :value => val[0]
    )
   result
  end
.,.,

 # reduce 68 omitted

module_eval <<'.,.,', 'grammar.ra', 440
  def _reduce_69( val, _values, result )
    result = AST::Default.new(
        :line => @lexer.line,
        :file => @lexer.file,
        :value => val[0]
    )
   result
  end
.,.,

 # reduce 70 omitted

module_eval <<'.,.,', 'grammar.ra', 493
  def _reduce_71( val, _values, result )
    # importing files
    # yuk, i hate keywords
    # we'll probably have to have some kind of search path eventually
    # but for now, just use a path relative to the file doing the importing
    dir = @lexer.file.sub(%r{[^/]+$},'').sub(/\/$/, '')
    if dir == ""
        dir = "."
    end
    result = AST::ASTArray.new(
        :file => @lexer.file,
        :line => @lexer.line
    )
    Dir.chdir(dir) {
        # We can't interpolate at this point since we don't have any 
        # scopes set up. Warn the user if they use a variable reference
        pat = val[1].value
        if pat.index("$")
             Puppet.warning(
                 "The import of #{pat} contains a variable reference;" +
                 " variables are not interpolated for imports " +
                 "in file #{@lexer.file} at line #{@lexer.line}"
             )
        end         
        files = Dir.glob(pat)
        if files.size == 0
            raise Puppet::ImportError.new("No file(s) found for import " + 
                                          "of '#{pat}'")
        end
        files.each { |file|
            parser = Puppet::Parser::Parser.new()
            parser.files = self.files
            Puppet.debug("importing '%s'" % file)
            begin
                parser.file = File.join(dir, file)
            rescue Puppet::ImportError
                Puppet.warning(
                    "Importing %s would result in an import loop" %
                        File.join(dir, file)
                )
                result = AST::ASTArray.new(
                    :file => @lexer.file,
                    :line => @lexer.line
                )
                next
            end
            # push the results into the main result array
            result.push parser.parse
        }
    }
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 504
  def _reduce_72( val, _values, result )
    result = AST::CompDef.new(
        :name => AST::Name.new(:value => val[1], :line => @lexer.line),
        :args => val[2],
        :file => @lexer.file,
        :line => @lexer.line,
        :keyword => val[0],
        :code => val[4]
    )
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 517
  def _reduce_73( val, _values, result )
    result = AST::CompDef.new(
        :name => AST::Name.new(:value => val[1], :line => @lexer.line),
        :args => val[2],
        :file => @lexer.file,
        :line => @lexer.line,
        :keyword => val[0],
        :code => AST::ASTArray.new(
            :line => @lexer.line,
            :file => @lexer.file,
            :children => []
        )
    )
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 534
  def _reduce_74( val, _values, result )
        #:args => val[2],
    args = {
        :name => AST::Name.new(:value => val[1], :line => @lexer.line),
        :file => @lexer.file,
        :line => @lexer.line,
        :keyword => val[0],
        :code => val[4]
    }
    # It'll be an ASTArray if we didn't get a parent
    if val[2].instance_of?(AST::Name)
        args[:parentclass] = val[2]
    end
    result = AST::ClassDef.new(args)
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 551
  def _reduce_75( val, _values, result )
    args = {
        :name => AST::Name.new(:value => val[1], :line => @lexer.line),
        :file => @lexer.file,
        :line => @lexer.line,
        :keyword => val[0],
        :code => AST::ASTArray.new(
            :line => @lexer.line,
            :file => @lexer.file,
            :children => []
        )
    }
    # It'll be an ASTArray if we didn't get a parent
    if val[2].instance_of?(AST::Name)
        args[:parentclass] = val[2]
    end
    result = AST::ClassDef.new(args)
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 572
  def _reduce_76( val, _values, result )
    unless val[1].instance_of?(AST::ASTArray)
        val[1] = AST::ASTArray.new(
            :line => val[1].line,
            :file => val[1].file,
            :children => [val[1]]
        )
    end
    args = {
        :file => @lexer.file,
        :line => @lexer.line,
        :names => val[1],
        :keyword => val[0],
        :code => val[4]
    }
    if val[2].instance_of?(AST::Name)
        args[:parentclass] = val[2]
    end
    result = AST::NodeDef.new(args)
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 595
  def _reduce_77( val, _values, result )
    unless val[1].instance_of?(AST::ASTArray)
        val[1] = AST::ASTArray.new(
            :line => val[1].line,
            :file => val[1].file,
            :children => [val[1]]
        )
    end
    args = {
        :file => @lexer.file,
        :line => @lexer.line,
        :keyword => val[0],
        :names => val[1],
        :code => AST::ASTArray.new(
            :line => @lexer.line,
            :file => @lexer.file,
            :children => []
        )
    }
    if val[2].instance_of?(AST::Name)
        args[:parentclass] = val[2]
    end
    result = AST::NodeDef.new(args)
   result
  end
.,.,

 # reduce 78 omitted

module_eval <<'.,.,', 'grammar.ra', 609
  def _reduce_79( val, _values, result )
    if val[0].instance_of?(AST::ASTArray)
        result = val[0]
        result.push val[1]
    else
        result = AST::ASTArray.new(
            :line => @lexer.line,
            :file => @lexer.file,
            :children => [val[0], val[1]]
        )
    end
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 617
  def _reduce_80( val, _values, result )
    result = AST::ASTArray.new(
        :line => @lexer.line,
        :file => @lexer.file,
        :children => []
    )
   result
  end
.,.,

 # reduce 81 omitted

module_eval <<'.,.,', 'grammar.ra', 622
  def _reduce_82( val, _values, result )
    result = val[1]
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 633
  def _reduce_83( val, _values, result )
    if val[1].instance_of?(AST::ASTArray)
        result = val[1]
    else
        result = AST::ASTArray.new(
            :line => @lexer.line,
            :file => @lexer.file,
            :children => [val[1]]
        )
    end
   result
  end
.,.,

 # reduce 84 omitted

module_eval <<'.,.,', 'grammar.ra', 647
  def _reduce_85( val, _values, result )
    if val[0].instance_of?(AST::ASTArray)
        val[0].push(val[2])
        result = val[0]
    else
        result = AST::ASTArray.new(
            :line => @lexer.line,
            :file => @lexer.file,
            :children => [val[0],val[2]]
        )
    end
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 655
  def _reduce_86( val, _values, result )
    result = AST::CompArgument.new(
        :line => @lexer.line,
        :file => @lexer.file,
        :children => [val[0],val[2]]
    )
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 662
  def _reduce_87( val, _values, result )
    result = AST::CompArgument.new(
        :line => @lexer.line,
        :file => @lexer.file,
        :children => [val[0]]
    )
   result
  end
.,.,

 # reduce 88 omitted

module_eval <<'.,.,', 'grammar.ra', 671
  def _reduce_89( val, _values, result )
    result = AST::Name.new(
        :value => val[1],
        :file => @lexer.file,
        :line => @lexer.line
    )
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 680
  def _reduce_90( val, _values, result )
    name = val[0].sub(/^\$/,'')
    result = AST::Variable.new(
        :line => @lexer.line,
        :file => @lexer.file,
        :value => name
    )
   result
  end
.,.,

module_eval <<'.,.,', 'grammar.ra', 692
  def _reduce_91( val, _values, result )
    if val[1].instance_of?(AST::ASTArray)
        result = val[1]
    else
        result = AST::ASTArray.new(
            :line => @lexer.line,
            :file => @lexer.file,
            :children => [val[1]]
        )
    end
   result
  end
.,.,

 # reduce 92 omitted

 # reduce 93 omitted

 # reduce 94 omitted

module_eval <<'.,.,', 'grammar.ra', 697
  def _reduce_95( val, _values, result )
 result = nil
   result
  end
.,.,

 def _reduce_none( val, _values, result )
  result
 end

    end   # class Parser

  end   # module Parser

end   # module Puppet
