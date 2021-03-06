%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2015
%%% @doc
%%% Определения для работы с информацией об узлах
%%% @end
%%% Created : 22. Февр. 2015 18:34
%%%-------------------------------------------------------------------

%% @doc Атом для запроса информации об узле
-define(GET_NODE_INFO, get_node_info).
%% @doc Атом ответа на запрос для получения информации об узле
-define(RESPONSE, response).
%% @doc Атом указывающий на то, что информация об узле отсутсвует
-define(NO_NODE_INFO, no_node_info).

%% @doc
%% nodeName - Наименование узла
%% nodeServer - Имя сервера на котором запущен узел
%% nodeNameServer - Соедененное значения имени узла и сервера
%% nodeLang - Язык программирования на котором написан узел
%% nodeExecutable - исполняемы файл для запуска узла (java, python, gcc)
-record(node_info, {nodeName :: string(), nodeServer :: string(), nodeNameServer :: string(), nodeLang :: string(),
  nodeExecutable :: string(), nodePreArguments :: list(), nodePostArguments :: list()}).
