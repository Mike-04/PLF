maxx(0,[]).
maxx(X,[H|T]) :-maxx(TM,T), H>TM , X is H.
maxx(X,[H|T]) :-maxx(TM,T), H=<TM , X is TM.

maxl(X,[X]).
maxl(X,[H|T]) :- maxl(TM,T), X is max(H,TM).

remove_elem(_, [], []).
remove_elem(E,[E],[]).
remove_elem(E,[H|T],R):-
    E\=H,
    remove_elem(E,T,R1),
    R = [H|R1].
remove_elem(E,[H|T],R):-
    E=H,
    remove_elem(E,T,R).


remove_max([],[]).
remove_max(E,R):-
    maxl(X,E),
    remove_elem(X,E,R).
