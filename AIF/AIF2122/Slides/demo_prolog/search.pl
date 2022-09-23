% Implementation of a depth first solver for the Blocks problem

successor(Stacks, [Stack1, [Top1|Stack2]|Other]) :-
   del([Top1 | Stack1], Stacks, Stacks1), 
   del(Stack2, Stacks1, Other).

goal(State) :- member([a, b, c], State).

% utility function
del(X, [X|L], L).    
del(X, [Y|L], [Y|L1]) :- del(X, L, L1).

% ?- solve([[c, a, b], [ ], [ ]], Solution), reverse(Solution, Z), writelist(Z).

% ===================
% implementation of a depth-first strategy with cycle breaking

solve(Node, Solution) :-
    depthfirst([ ], Node, Solution).   % first argument is the path to Node

depthfirst(Path, Node, [Node | Path]) :-
    goal( Node).

depthfirst(Path, Node, Sol) :-
    successor(Node, Node1),
    not(member( Node1, Path)), % breaks cycles
    depthfirst([Node | Path], Node1, Sol).

% Note that solution paths are constructed in reverse order (goal on top). For efficiency.
% Utility for printing a list

writelist([]).
writelist([X|Y]) :- write(X), nl, writelist(Y).

% ?- solve1([[c, a, b], [ ], [ ]], Solution), reverse(Solution, Z), writelist(Z).

% Blocks world with iterative deepening - version 1.

depthfirstL(Node, [Node], _ ) :-
     goal(Node).

depthfirstL(Node, [Node|Sol], Max) :-   % Max is the depth limit
     Max > 0,
     successor(Node, Node1),                                                                                
     Max1 is Max-1,
     depthfirstL(Node1, Sol, Max1).

solve2(Node, Sol, N) :-                % tries a depth-limited search to N
    depthfirstL(Node, Sol, N).

solve2(Node, Sol, N) :-                % increases N and tries with a greater depth limit
    N1 is N+1,
    solve2(Node, Sol, N1).

%?- depthfirstL([[c, a, b], [ ], [ ]], Solution, 3), writelist(Solution).
%?- solve2([[c, a, b], [ ], [ ]], Solution, 0), writelist(Solution).

% Blocks world with iterative deepening - version 2.

path(Node, Node, [Node]).

path(FirstNode, LastNode, [LastNode | Path]) :-
    path(FirstNode, OneButLast, Path),
    successor(OneButLast, LastNode),
    not(member(LastNode, Path).
    path(Node, Node, [Node]).

path(FirstN, LastN, [LastN | Path]) :-    
    path(FirstN, OneButLast, Path),    
    successor(OneButLast, LastN),
    not(member(LastN, Path)).

solve3(Node, Solution) :-    
    path(Node, GoalNode, Solution),
    goal(GoalNode).

% ?- solve3([[c, a, b], [ ], [ ]], Solution), reverse(Solution, Z),  writelist(Z).
