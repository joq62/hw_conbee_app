%%%-------------------------------------------------------------------
%% @doc hw_conbee_app public API
%% @end
%%%-------------------------------------------------------------------

-module(hw_conbee_app_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    hw_conbee_app_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
