% ============================================================================
% TASK 2: SOME (◇)
% ============================================================================

% ---------------- Helpers ----------------

% next/3: Wrapper para edge.
% Se usa _Model para ignorar el nombre, asume que los hechos edge/2 son globales.
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

% ============================================================================
% TESTING TASK 2 INDEPENDENTLY
% ============================================================================
% Dado que esta tarea depende del grafo del modelo, se debe cargar task1.pl primero.
%
% 1. Load files:
%    ?- ['task1.pl', 'task2.pl'].
%
% 2. Example Queries:
%
%    ?- some(p, a, model).
%    true.
%    (Explanation: 'a' reaches 'b' and 'c', which contain 'p')
%
%    ?- some(q, a, model).
%    true.
%    (Explanation: 'a' reaches 'd', which contains 'q')
%
%    ?- some(p, c, model).
%    false.
%    (Explanation: 'c' is a leaf node, it has no future nodes)
% ============================================================================