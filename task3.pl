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

% ---------------- Examples ----------------
% ?- always(p, a, model).
% false.
% ?- always(p, b, model).
% true.
% ?- always(p, c, model).
% true.