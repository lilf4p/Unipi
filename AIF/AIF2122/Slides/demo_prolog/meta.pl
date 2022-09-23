member(X, [X |_]).        %  example program 
member(X, [_| Tail]) :- 
     member(X, Tail).
%?- member(3, [1, 2, 3]).
%-------------------------------------------------------
% Vanilla meta-interpreter

prove(true).

prove(Goal) :-
     clause(Goal, Body),
     prove(Body).

prove(Goal1, Goal2) :-
     prove(Goal1), prove(Goal2).

%?- clause(member(3, [3, 2, 1]), Body).
%?- prove(member(3, [1, 2, 3])).
%-------------------------------------------------------
% tracing meta-interpreter

proveT(true) :- !.

proveT((Goal1, Goal2)) :- !,
   proveT(Goal1),
   proveT(Goal2).

proveT(Goal) :-
   write('Call: '), write(Goal), nl,
   clause(Goal, Body),
   proveT(Body),
   write('Exit: '), write(Goal), nl.
