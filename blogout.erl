-module(blogout).
-compile(export_all).

isInteger(S) ->
    try
        _ = list_to_integer(S),
        true
    catch error:badarg ->
        false
    end.

run() ->
  {ok, Files} = file:list_dir("./"),
  Files2 = lists:filter(fun(E) -> isInteger(E) end, Files),
  Files3 = lists:map(fun(E) -> list_to_integer(E) end, Files2),
  Files4 = lists:sort(fun(A,B) -> A < B end, Files3),
  Files4.
  
