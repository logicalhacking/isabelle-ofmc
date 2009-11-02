signature OfmcFpParser_TOKENS =
sig
type ('a,'b) token
type svalue
val TXOR: (string) *  'a * 'a -> (svalue,'a) token
val TWITNESS: (string) *  'a * 'a -> (svalue,'a) token
val TTYPES: (string) *  'a * 'a -> (svalue,'a) token
val TSTEP: (string) *  'a * 'a -> (svalue,'a) token
val TSTATE: (string) *  'a * 'a -> (svalue,'a) token
val TSEMICOLON: (string) *  'a * 'a -> (svalue,'a) token
val TSECTION: (string) *  'a * 'a -> (svalue,'a) token
val TSECSTATE: (string) *  'a * 'a -> (svalue,'a) token
val TSECRET: (string) *  'a * 'a -> (svalue,'a) token
val TSCRYPT: (string) *  'a * 'a -> (svalue,'a) token
val TRULES: (string) *  'a * 'a -> (svalue,'a) token
val TREQUEST: (string) *  'a * 'a -> (svalue,'a) token
val TBACKEND: (string) *  'a * 'a -> (svalue,'a) token
val TPROTOCOL: (string) *  'a * 'a -> (svalue,'a) token
val TOPAREN: (string) *  'a * 'a -> (svalue,'a) token
val TOBRACKET: (string) *  'a * 'a -> (svalue,'a) token
val TMETAIMPLIES: (string) *  'a * 'a -> (svalue,'a) token
val TKNOWLEDGE: (string) *  'a * 'a -> (svalue,'a) token
val TINV: (string) *  'a * 'a -> (svalue,'a) token
val TINITIAL: (string) *  'a * 'a -> (svalue,'a) token
val TIKNOWS: (string) *  'a * 'a -> (svalue,'a) token
val TFPState: (string) *  'a * 'a -> (svalue,'a) token
val TFIXEDPOINT: (string) *  'a * 'a -> (svalue,'a) token
val TFACT: (string) *  'a * 'a -> (svalue,'a) token
val TEXP: (string) *  'a * 'a -> (svalue,'a) token
val TQUOTE: (string) *  'a * 'a -> (svalue,'a) token
val TCRYPT: (string) *  'a * 'a -> (svalue,'a) token
val TCPAREN: (string) *  'a * 'a -> (svalue,'a) token
val TCOMMA: (string) *  'a * 'a -> (svalue,'a) token
val TBAR: (string) *  'a * 'a -> (svalue,'a) token
val TNEQ: (string) *  'a * 'a -> (svalue,'a) token
val TEQ: (string) *  'a * 'a -> (svalue,'a) token
val TWHITESPACE: (string) *  'a * 'a -> (svalue,'a) token
val TCOLON: (string) *  'a * 'a -> (svalue,'a) token
val TCBRACKET: (string) *  'a * 'a -> (svalue,'a) token
val TCAT: (string) *  'a * 'a -> (svalue,'a) token
val TMINUS: (string) *  'a * 'a -> (svalue,'a) token
val TARROW: (string) *  'a * 'a -> (svalue,'a) token
val TATTACK: (string) *  'a * 'a -> (svalue,'a) token
val TABSTRACTION: (string) *  'a * 'a -> (svalue,'a) token
val SIMPLE_NAME: (string) *  'a * 'a -> (svalue,'a) token
val EOF:  'a * 'a -> (svalue,'a) token
end
signature OfmcFpParser_LRVALS=
sig
structure Tokens : OfmcFpParser_TOKENS
structure ParserData:PARSER_DATA
sharing type ParserData.Token.token = Tokens.token
sharing type ParserData.svalue = Tokens.svalue
end
