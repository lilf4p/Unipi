% membership in a list
    
member(X, [X | _]).
member(X, [_ | Tail]) :- member(X, Tail).
%?- member(3, [1,2,3,4,5]).
%?- member(Z, [1,2,3,4,5]).
%?- member(1, W).

% list concatenation
    
myconc([ ], L, L).
myconc([X | L1], L2, [X | L3]) :- myconc(L1, L2, L3).
% myconc([1, 2], [3, 4], Z).
% myconc([1, 2], W, [1,2,3,4,5]).

len1([ ], 0).
len1([_|Tail], N) :- len1(Tail, N1), N is 1+N1. 
%?- len1([a, b, c], Z).

len2([ ], 0).
len2([_|Tail], N+1) :-  len2(Tail, N).
%?- len2([a, b, c], Z), Length is Z.

family(
   person(tom, fox, date(7,may,1950), works(bbc,15200)), 
   person(ann, fox, date(9,may, 1951), unemployed),
  [person(pat, fox, date(5,may,1973), unemployed),
    person(jim, fox, date(5,may,1973), unemployed)]).

%?- family(person( _, fox, _, _), _, _).
%?- family(X,_,[_,_]).

% define some selectors
husband(X):- family( X, _, _).
wife(X):- family( _, X, _).
child(X) :- family( _, _, Children), member( X, Children).
dateofbirth(person( _, _, Date, _), Date).

%?- child(X), dateofbirth(X, date(_, may, _)). 

exists(P) :- husband(P); wife(P); child(P).   
%?- exists(P),  dateofbirth(P, date(_, _, Y)), Y < 1970.

salary(person(_, _, _, works(_, S)), S).
salary(person(_, _, _, unemployed), 0).

total([ ], 0).
total([P|L], Sum) :- salary(P, S), total(L, R), Sum is S + R.

%?- family(H, W, C), total([H, W | C], FamilyIncome).


