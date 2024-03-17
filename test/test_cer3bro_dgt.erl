-module(test_cer3bro_dgt).

-include_lib("eunit/include/eunit.hrl").

compose_stores_combine_objs_test() ->
    S1 = #{"some_name" => future},
    S2 = #{"other_name" => 3},
    Expected_Store = #{"other_name" => 3, "some_name" => future},
    ?assert(cer3bro_dtg:compose_stores(S1, S2) == Expected_Store).

compose_stores_prefers_concrete_objs_test() ->
    S1 = #{"some_name" => future},
    S2 = #{"some_name" => 3},
    Expected_Store = #{"some_name" => 3},
    ?assert(cer3bro_dtg:compose_stores(S1, S2) == Expected_Store),
    ?assert(cer3bro_dtg:compose_stores(S2, S1) == Expected_Store).
