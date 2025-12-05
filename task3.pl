% ============================================================================
% TASK 3: ALWAYS (□)
% ============================================================================

% ---------------- Helpers (Requeridos para que compile independientemente) ----------------

next(Node, Next, _Model) :-
    edge(Node, Next).

reachable(Start, Next, Model, _) :-
    next(Start, Next, Model).

reachable(Start, Target, Model, Visited) :-
    next(Start, Mid, Model),
    \+ member(Mid, Visited),
    reachable(Mid, Target, Model, [Mid | Visited]).

% all_reachable/3: Obtiene todos los futuros únicos.
all_reachable(Start, Model, List) :-
    findall(N, reachable(Start, N, Model, [Start]), Raw),
    sort(Raw, List).

% ---------------- Main Predicate ----------------

% always/3: Verdadero si TODOS los nodos futuros tienen el predicado.
always(Pred, Node, Model) :-
    all_reachable(Node, Model, Reachables),
    ( Reachables = [] ->
        true  % Vacuously true
    ;
        forall(member(N, Reachables),
               (node(N, PredList), member(Pred, PredList)))
    ).

% ============================================================================
% TESTING TASK 3 INDEPENDENTLY
% ============================================================================
% Dado que esta tarea depende del grafo del modelo, se debe cargar task1.pl primero.
%
% 1. Load files:
%    ?- ['task1.pl', 'task3.pl'].
%
% 2. Example Queries:
%
%    ?- always(p, b, model).
%    true.
%    (Explanation: 'b' only goes to 'c', and 'c' has 'p')
%
%    ?- always(p, a, model).
%    false.
%    (Explanation: 'a' goes to 'd', and 'd' does NOT have 'p')
%
%    ?- always(ANYTHING, c, model).
%    true.
%    (Explanation: Vacuously true. 'c' has no future nodes, so "all futures"
%     technically satisfy the condition)
% ============================================================================