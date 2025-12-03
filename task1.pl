% ============================================================================
% TASK 1: MODEL DEFINITION
% ============================================================================

% edge(Source, Target).
edge(a, b).
edge(b, c).
edge(a, d).

% node(Node, ValidPredicatesList).
node(a, []).
node(b, [p]).
node(c, [p]).
node(d, [q]).