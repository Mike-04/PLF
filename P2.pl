eliminaConsec([_],1,[]).
eliminaConsec([H],0,[H]).
eliminaConsec([H1,H2|T],_,R):-
    H2 =:= H1+1,
    eliminaConsec([H2|T],1,R).
eliminaConsec([H1,H2|T],1,R):-
    H2 =\= H1+1,
    eliminaConsec([H2|T],0,R).
eliminaConsec([H1,H2|T],0,[H1|R]):-
    H2 =\= H1+1,
    eliminaConsec([H2|T],0,R).

elimConsecList([H],[R]):-
    number(H),
    R is H.
elimConsecList([H],[R]):-
    is_list(H),
    eliminaConsec(H,0,R).
elimConsecList([H|L],[H1|R]):-
    is_list(H),
    eliminaConsec(H,0,H1),
    elimConsecList(L,R).
elimConsecList([H|L],[H|R]):-
    number(H),
    elimConsecList(L,R).





