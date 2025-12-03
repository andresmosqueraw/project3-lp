% ============================================================================
% GRAFO DE PRUEBA "TORTURE TEST"
% ============================================================================
% Estructura del Grafo:
%
%    [n1] ---> [n2] ---> [n3] (Hoja/Dead-end)
%      |         |
%      |         v
%      +-----> [n4] <==> [n5] (Ciclo entre n4 y n5)
%
% Contenido de los nodos (Predicados válidos):
% n1: [a, start]    -> 'a' es común, 'start' solo aquí.
% n2: [a, b]        -> 'b' aparece aquí.
% n3: [a, c]        -> 'c' aparece en una hoja.
% n4: [a, d]        -> 'd' está en el ciclo.
% n5: [a, e]        -> 'e' está en la otra parte del ciclo.
% ============================================================================

% --- Definición de Nodos ---
node(n1, [a, start]).
node(n2, [a, b]).
node(n3, [a, c]).
node(n4, [a, d]).
node(n5, [a, e]).

% --- Definición de Aristas ---
edge(n1, n2).
edge(n1, n4).
edge(n2, n3).
edge(n2, n4).
% Ciclo aquí:
edge(n4, n5).
edge(n5, n4).

% ============================================================================
% INSTRUCCIONES:
% 1. Cargar archivos: ['task1.pl', 'task2.pl', 'task3.pl'].
% 2. Carga este archivo (si no se ha definido los hechos en task1).
%    (Si task1 ya tiene hechos, comenta los de task1 o usa este test aparte).
% ============================================================================