parent(X, Y) :- father(X, Y). 
parent(X, Y) :- mother(X, Y).
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
father(john, mark).
father(john, luc).
mother(lia, john).



%% ?- parent(lia, gio).                          Is Lia a parent of Gio?
%% ?- ancestor(lia, mark).                       Is Liaana ancestor of Mark?
%% ?- father(X, mark).                           Who is the father of Mark?
%% ?- father(gio, X).                            Who are the children of Gio?
%% ?- parent(X, Y).               Who is father of who? Who is parent of who?

%% ?- parent(X, Y), parent(X, Z), not(Y=Z).     Who is brother/sister of who??
%% ?- parent(lia, X), genitore(X, Y).           Grand-children of Lia.
