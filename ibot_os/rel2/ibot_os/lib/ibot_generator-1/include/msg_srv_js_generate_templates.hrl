%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. Mar 2015 2:09 AM
%%%-------------------------------------------------------------------

%% New line char
-define(NEW_LINE, "\n").

%% Tab
-define(TAB(Number), string:copies("\t", Number)).

%%Tab with text
-define(TAB_STRING(TextList, Number), string:join([?TAB(Number), TextList], "")).

%% Java import block
-define(JS_MSG_FILE_HEADER(MsgName), string:join([
  ?MSG_CLASS_NAME(MsgName)
  %, "", ""
], ?NEW_LINE)).

%% File end
%-define(JAVA_MSG_FILE_END, string:join(["}"], ?NEW_LINE)).

%% Message class name
-define(MSG_CLASS_NAME(MsgName), string:join(["function ", MsgName, "(msg) {"], "")).

%% Generate OTP and Java properties
-define(PRIVATE_PROPERTIES_OTP_LANG(Type, Name),
  string:join([
    %?PRIVATE_OTP_PROPERTY(Type, Name),
    %?PRIVATE_LANG_PROPERTY(Type, Name),
    "", ""
  ], ?NEW_LINE)
).

%% Crate properties OTP
%-define(PRIVATE_OTP_PROPERTY(Type, Name), ?TAB_STRING([string:join(["private", ?OTP_TYPE(Type), string:join([Name, "Otp;"], "")], " ")], 1)).
%% Create properties Java
%-define(PRIVATE_LANG_PROPERTY(Type, Name), ?TAB_STRING([string:join(["private", ?LANG_TYPE(Type), string:join([Name, ";"], "")], " ")], 1)).
-define(PRIVATE_LANG_PROPERTY(Type, Name), ?TAB_STRING([string:join(["this.", Name, ";"], "")], 1)).

%% Constructor message class
-define(CONSTRUCTOR_HEADER(Name), string:join([?TAB(1), "def __init__(self):"], "")).
%% Resutl OTP object initialization
%-define(RESULT_OBJ_DEFINE(ObjCount), string:join(["this.resultObject = [None] * ", io_lib:format("~p", [ObjCount])], "")).
-define(CONSRTUCTOR(Name, ObjCount), "").
  %string:join([
  %?CONSTRUCTOR_HEADER(Name),
  %?TAB_STRING([?RESULT_OBJ_DEFINE(ObjCount)], 2)
  %?TAB_STRING(["}"], 1)
%], ?NEW_LINE)).

%% Constructor message class
-define(CONSTRUCTOR_HEADER_WITH_PARAMS(Name, ObjCount), string:join([
  ?NEW_LINE,
  %?NEW_LINE,
  %?TAB(1), "def __init__(self, msg = None):",
  %?NEW_LINE,
  %?TAB_STRING([?RESULT_OBJ_DEFINE(ObjCount)], 2),
  ?NEW_LINE,
  ?TAB(1), "if (msg) {"], "")).
-define(CONSRTUCTOR_WITH_PARAMS_CREATE_PARAMETER(Type, Name, ObjectNum), string:join([
  ?CONSRTUCTOR_WITH_PARAMS_INIT_PARAMETER_STRING(Type, Name, ObjectNum)
], ?NEW_LINE)).

-define(CONSRTUCTOR_WITH_PARAMS_INIT_PARAMETER_STRING(Type, Name, ObjectNum),
  string:join([?NEW_LINE, ?TAB(2), "this.", Name, " = ",  "msg[", io_lib:format("~p", [ObjectNum]), "];", ""], "")
).

%?CONVERT_FROM_OTP_TO_JS_METHODS(Type),
-define(CONSTRUCTOR_END_WITH_PARAMS(), ?TAB_STRING([?NEW_LINE, ?TAB(1), "}"], 1)).
-define(END_BLOCK(TabNumber), ?TAB_STRING([?NEW_LINE, ?TAB(TabNumber), "}"], 1)).


%% Create OTP message from java types
-define(GET_OTP_TYPE_MSG(ResulyArray), string:join([
  "", "",
  ?TAB_STRING(["this.getMessage = function() {"], 1),
  ?TAB_STRING(["return ", ResulyArray, ";"], 2),
  ?TAB_STRING(["}"], 1)
], ?NEW_LINE)).



%% Generate getter method definition
-define(GETTER_DEFINITION(Type, Name), string:join([
  %?TAB_STRING(["@property"], 1),
  ?NEW_LINE,
  ?TAB_STRING(["this.", Name, " = ", ?DEFAULT_VALUE(Type), ";"], 1)
], "")).

%% Generate setter mathod definition
-define(SETTER_DEFINITION(Type, Name, ObjNumber), string:join([
  %?TAB_STRING(["@", Name, ".setter"], 1),
  %?NEW_LINE,
  ?TAB_STRING(["def set_", Name, "(self, val):"], 1),
  ?NEW_LINE,
  ?TAB_STRING(["self._", Name, " = val"], 2),
  ?NEW_LINE,
  ?TAB_STRING(["self.resultObject[", integer_to_list(ObjNumber), "] = " , ?OTP_TYPE(Type), "(val)"], 2),
  ?NEW_LINE
], "")).

%% Generate getters and setters
-define(GETTER_SETTER_GENERATE(Type, Name, ObjNumber), string:join([
  "",
  ?GETTER_DEFINITION(Type, Name)
], ?NEW_LINE)).


-define(RESULT_ARRAY_ITEM_GENERATE(Type, Name, ObjNumber), string:join([
  ?GETERATE_RESULT_IN_TYPE(Type, Name)
], "")).

-define(GETERATE_RESULT_IN_TYPE(Type, Name),
  case Type of
    "String" -> string:join([" + \"\\\"\" + this.", Name," + \"\\\"\" + "], "");
    "BigInt" -> string:join([" + this.", Name , " + "], "");
    _ -> string:join([" + this.", Name, " + "], "")
  end).

-define(GET_RESULT_ITEM_DELIMETER(ObjNumber), case ObjNumber of
                                                0 -> "";
                                                _ -> "\",\""
                                              end).
%-define(GETTER_SETTER_GENERATE(Type, Name, ObjNumber), string:join([
%  "", "",
%  ?GETTER_DEFINITION(Type, Name),
%  "",
%  ?SETTER_DEFINITION(Type, Name, ObjNumber),
%  ""
%], ?NEW_LINE)).


%% Get OPT type
-define(OTP_TYPE(Type),
  case Type of
    "String" -> "erl_term.ErlString";
    "Long" -> "erl_term.ErlLong";
    _ -> "UNDEFINE"
  end
).

-define(DEFAULT_VALUE(Type),
  case Type of
    "String" -> "\"\"";
    "Long" -> "0";
    _ -> "UNDEFINE"
  end
).

%% Get Java type
-define(LANG_TYPE(Type),
  case Type of
    "String" -> "String";
    "Long" -> "Long";
    _ -> "UNDEFINE"
  end
).

-define(CONVERT_FROM_OTP_TO_JS_METHODS(Type),
  case Type of
    "String" -> "str";
    "Long" -> "long";
    _ -> "UNDEFINE"
  end
).