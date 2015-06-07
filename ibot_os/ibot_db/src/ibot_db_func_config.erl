%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. Mar 2015 8:14 PM
%%%-------------------------------------------------------------------
-module(ibot_db_func_config).

-include("../../ibot_core/include/debug.hrl").
-include("ibot_db_reserve_atoms.hrl").
-include("ibot_db_table_names.hrl").
-include("ibot_db_project_config_param.hrl").
-include("../../ibot_core/include/ibot_core_reserve_atoms.hrl").
-include("../../ibot_nodes/include/ibot_nodes_registration_info.hrl").
-include("ibot_db_modules.hrl").
-include("ibot_db_table_commands.hrl").
-include("ibot_db_records.hrl").

%% API
-export([get_full_project_path/0, set_full_project_path/1, set_node_info/1, get_node_info/1, get_all_registered_nodes/0]).
-export([add_node_name_to_config/1, get_nodes_name_from_config/0]).
-export([add_project_config_info/1, get_project_config_info/0]).
-export([add_core_config_info/1, get_core_config_info/0, get_children_project_names_list/0]).
-export([generate_nodes_info_to_list/2]).


%%% ====== full project path mathods start ======

%% @doc
%% Get project path from config db
%%
%% @spec get_full_project_path() -> [{?FULL_PROJECT_PATH, string()}] | ?FULL_PROJECT_PATH_NOT_FOUND | ?ACTION_ERROR.
%% @end

-spec get_full_project_path() -> [{?FULL_PROJECT_PATH, string()}] | ?FULL_PROJECT_PATH_NOT_FOUND | ?ACTION_ERROR.

get_full_project_path() ->
  case gen_server:call(?IBOT_DB_SRV, {?GET_RECORD, ?TABLE_CONFIG, ?FULL_PROJECT_PATH}) of
    {ok, Full_Project_Path} ->  ?DBG_MODULE_INFO("get_full_project_path: ~p~n", [?MODULE, Full_Project_Path]),
      Full_Project_Path;
    [] -> ?FULL_PROJECT_PATH_NOT_FOUND
  end.


%% @doc
%% Set project path from config db
%%
%% @spec set_full_project_path(ProjectPath) -> ok when ProjectPath :: string().
%% @end

-spec set_full_project_path(ProjectPath) -> ok when ProjectPath :: string().

set_full_project_path(ProjectPath) ->
  ?DBG_MODULE_INFO("set_full_project_path(ProjectPath) -> ~p~n", [?MODULE, ProjectPath]),
  gen_server:call(?IBOT_DB_SRV, {?ADD_RECORD, ?TABLE_CONFIG, ?FULL_PROJECT_PATH, ProjectPath}),
  ok.

%%% ====== full project path mathods end ======


add_node_name_to_config(NodeName) ->
  case gen_server:call(?IBOT_DB_SRV, {?GET_RECORD, ?TABLE_CONFIG, ?PROJECT_NODES_LIST}) of
    {ok, ConfigNodeNamesList} ->
      gen_server:call(?IBOT_DB_SRV, {?ADD_RECORD, ?TABLE_CONFIG, ?PROJECT_NODES_LIST, lists:append(ConfigNodeNamesList, [NodeName])});

    Vals -> ?DBG_MODULE_INFO("add_node_name_to_config(NodeName) Vals ->...~p~n", [? MODULE, Vals]),
      gen_server:call(?IBOT_DB_SRV, {?ADD_RECORD, ?TABLE_CONFIG, ?PROJECT_NODES_LIST, [NodeName]})
  end,
  ok.

get_nodes_name_from_config() ->
  ?DBG_MODULE_INFO("get_node_name_from_config() -> ~p~n", [?MODULE, gen_server:call(?IBOT_DB_SRV, {?GET_RECORD, ?TABLE_CONFIG, ?PROJECT_NODES_LIST})]),
  %gen_server:call(?IBOT_DB_SRV, {?GET_RECORD, ?TABLE_CONFIG, ?PROJECT_NODES_LIST}).
  case ibot_db_srv:get_record(?TABLE_CONFIG, ?PROJECT_NODES_LIST) of
    {ok, NodesNameList} -> NodesNameList;
    _ -> error
  end.




set_node_info(NodeInfoRecord) ->
  ibot_db_func:add_to_mnesia(NodeInfoRecord),
  %ibot_db_srv:add_record(?TABLE_NODE_INFO, NodeInfoRecord#node_info.atomNodeName, NodeInfoRecord),
  ?DBG_MODULE_INFO("set_node_info(NodeInfoRecord) -> -> ~p~n", [?MODULE, NodeInfoRecord]),
  ok.

get_node_info(AtomNodeName) ->
  ?DBG_MODULE_INFO("get_node_info(AtomNodeName) -> ~p~n", [?MODULE, ibot_db_func:get_from_mnesia(node_info, AtomNodeName)]),
  %case ibot_db_func:get_from_mnesia(node_info, AtomNodeName) of
  %  [] -> not_found;
  %  NodeInfo -> NodeInfo
  %end.
  ibot_db_func:get_from_mnesia(node_info, AtomNodeName).

get_all_registered_nodes() ->
  case ibot_db_func_config:get_nodes_name_from_config() of
    error -> [];
    NodeNameList ->
      ibot_db_func_config:generate_nodes_info_to_list(NodeNameList, "")
  end.

generate_nodes_info_to_list([], NodeInfoList) ->
  NodeInfoList;
generate_nodes_info_to_list([NodeName | NodeNameList], NodeInfoList) ->
  case ibot_db_func_config:get_node_info(list_to_atom(NodeName)) of
    not_found -> NewNodeInfoList = NodeInfoList;
    Item ->
      NewNodeInfoList = string:join([NodeInfoList,
        string:join([Item#node_info.nodeName, Item#node_info.nodeLang], "#")], "&")
  end,
  generate_nodes_info_to_list(NodeNameList, NewNodeInfoList).

%% ====== Core Config Information Start ======

add_core_config_info(CoreConfigInfo) ->
  ?DBG_MODULE_INFO("add_core_config_info(CoreConfigInfo) -> ~p~n", [?MODULE, CoreConfigInfo]),
  ibot_db_srv:add_record(?TABLE_CONFIG, core_info, CoreConfigInfo),
  ok.

get_core_config_info() ->
  case ibot_db_srv:get_record(?TABLE_CONFIG, core_info) of
    record_not_found -> [];
    CoreConfigInfo -> CoreConfigInfo
  end.

%% ====== Core Config Information End ======




%%% ====== Project Config Information Start ======

%% @doc
%%
%% Add information from project configuration file
%% @spec add_project_config_info(ProjectInfo) -> ok when ProjectInfo :: #project_info{}.
%% @end
-spec add_project_config_info(ProjectInfo) -> ok when ProjectInfo :: #project_info{}.

add_project_config_info(ProjectInfo) ->
  ibot_db_srv:add_record(?TABLE_CONFIG, project_config_info, ProjectInfo),
  ok.

%% @doc
%%
%% Get information about project from DB
%% @spec get_project_config_info() -> [] | #project_info{}.
%% @end
-spec get_project_config_info() -> [] | #project_info{}.

get_project_config_info() ->
  case ibot_db_srv:get_record(?TABLE_CONFIG, project_config_info) of
    record_not_found -> [];
    {ok, ProjectInfo} -> ProjectInfo
  end.

get_children_project_names_list() ->
  ?DBG_MODULE_INFO("get_children_project_names_list() -> ~p~n", [?MODULE, get_project_config_info()]),
  %case get_project_config_info() of
  %  [] -> [];
  %  ProjectInfo -> ProjectInfo#project_info.childrenProjectName
  %end.
[].
%%% ====== Project Config Information End ======