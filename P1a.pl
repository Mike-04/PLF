% Predicat care calculeaza numarul de aparitii ale unui element intr-o lista
count(_, [], 0).
count(E, [E|T], N) :- count(E, T, N1), N is N1 + 1.
count(E, [P|T], N) :- P \= E, count(E, T, N).

% Predicat care elimina elementele care se repeta
elim_duplicates([], []).
elim_duplicates([H|T], R) :-
    count(H, [H|T], N),    % Numaram aparitiile lui H in lista
    N =:= 1,
    elim_duplicates(T, R1), % Continuam cu restul listei
    R = [H|R1].
elim_duplicates([H|T], R) :-
    count(H, [H|T], N),    % Daca apare mai mult de o data
    N > 1,                 % Nu il adaugam in lista rezultat
    elim_duplicates(T, R). % Continuam cu restul listei
