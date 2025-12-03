% ============================================================================
% TASK 2: SOME (◇)
% ============================================================================

% ---------------- Helpers ----------------

% next/3: Wrapper para edge.
% Usamos _Model para ignorar el nombre, asumiendo que los hechos edge/2 son globales.
% CORRECCIÓN IMPORTANTE: Usamos edge() directo, no clause().
next(Node, Next, _Model) :-
    edge(Node, Next).

% reachable/4: Encuentra nodos alcanzables (futuro estricto, evita ciclos).
reachable(Start, Next, Model, _) :-
    next(Start, Next, Model).

reachable(Start, Target, Model, Visited) :-
    next(Start, Mid, Model),
    \+ member(Mid, Visited),
    reachable(Mid, Target, Model, [Mid | Visited]).

% ---------------- Main Predicate ----------------

% some/3: Verdadero si existe un nodo futuro con el predicado.
some(Pred, Node, Model) :-
    reachable(Node, FutureNode, Model, [Node]),
    node(FutureNode, PredList),
    member(Pred, PredList).

% ---------------- Examples ----------------
% ?- some(p, a, model).
% true.
% ?- some(q, a, model).
% true.
% ?- some(p, c, model).
% false.