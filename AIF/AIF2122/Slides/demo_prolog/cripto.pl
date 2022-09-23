:- use_module(library(clpfd)).

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

   %?- solve(N1, N2, N3).

   %?- A in 1..2, B in 1..2, labeling([], [A, B]), all_different([A, B]).
