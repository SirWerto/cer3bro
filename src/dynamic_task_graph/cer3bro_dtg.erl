-module(cer3bro_dtg).

-export([compose_stores/2]).

-type name() :: binary().
-type concrete() :: any().
-type future() :: future.
-type obj() :: concrete() | future().

-type store() :: #{name() => obj()}.

-type task() :: any().

-type task_graph() :: #{store := store(), taks := list(task())}.


-spec compose_stores(S1 :: store(), S2 :: store()) -> store().
compose_stores(S1, S2) ->
    maps:merge_with(fun combiner/3, S1, S2).

combiner(_Key, future, V2) -> V2;
combiner(_Key, V1, future) -> V1;
combiner(_Key, future, future) -> future;
combiner(_Key, V, V) -> V.

