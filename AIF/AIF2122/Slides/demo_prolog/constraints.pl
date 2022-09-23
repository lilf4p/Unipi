:- use_module(library(clpr)).

convert(Euro, USD) :- USD is Euro * 0.842.
convert_r(Euro, USD) :- {USD = Euro * 0.842}.

% Compare
% ?- convert(200, USD).
% ?- convert(EUR, 200).
% ?- convert_r(EUR, 200).
% ?- convert_r(EUR, USD).

triangle(X, Y, Z) :-
  X > 0, Y > 0, Z > 0, 
  X+Y >= Z, Y+Z >= X, X+Z >= Y.

%?- triangle(3, 4, 5).
triangle_clp(X, Y, Z) :-    
  {X > 0, Y > 0, Z > 0, X+Y >= Z,   
  Y+Z >= X, X+Z >=Y}. 

%?- triangle_clp(3, 4, Z).

:- use_module(library(clpfd)).

 triangle_fd(X, Y, Z) :-
     X #> 0, Y #> 0, Z #> 0, 
     X+Y #>= Z, Y+Z #>= X, 
     X+Z #>= Y. 

%?- triangle_fd(3, 4, Z).

% =======================

solve([D,O,N,A,L,D], [G,E,R,A,L,D], [R,O,B,E,R,T]) :-    
   Vars = [D,O,N,A,L,G,E,R,B,T],    
   D in 0..9, O in 0..9, N in 0..9, A in 0..9,    
   L in 0..9, G in 0..9, E in 0..9, R in 0..9,    
   B in 0..9, T in 0..9,    
   all_different(Vars),    
   100000*D+10000*O+1000*N+100*A+10*L+D +    
   100000*G+10000*E+1000*R+100*A+10*L+D #= 
   100000*R+10000*O+1000*B+100*E+10*R+T,       
   labeling([ ], Vars).

%?- solve([D,O,N,A,L,D], [G,E,R,A,L,D], [R,O,B,E,R,T]).
%?- solve([D,O,N,A,L,D], [G,E,R,A,L,D], N3).
%?- solve(N1, N2, N3).
