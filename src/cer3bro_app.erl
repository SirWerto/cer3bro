%%%-------------------------------------------------------------------
%% @doc cer3bro public API
%% @end
%%%-------------------------------------------------------------------

-module(cer3bro_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    cer3bro_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
