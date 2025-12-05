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

% ============================================================================
% TESTING TASK 1 INDEPENDENTLY
% ============================================================================
% Para testear este archivo, cargarlo y hacer el query directamente.
%
% 1. Load the file:
%    ?- ['task1.pl'].
%
% 2. Example Queries:
%
%    ?- edge(a, X).
%    X = b ;
%    X = d.
%    (Verifies that 'a' is connected to 'b' and 'd')
%
%    ?- node(b, Predicates).
%    Predicates = [p].
%    (Verifies that node 'b' contains predicate 'p')
% ============================================================================