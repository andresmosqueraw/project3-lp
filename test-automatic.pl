% ============================================================================
% TEST SUITE AUTOMÁTICO PARA TASK 1–3
% Usa el grafo “m” definido con node/2 y edge/2
% ============================================================================

% Alias del modelo (solo para cumplir la firma some/3 y always/3)
m.

% Ejecutar todas las pruebas:
run_tests :-
    writeln('===================================='),
    writeln('       RUNNING AUTOMATIC TESTS'),
    writeln('===================================='), nl,

    test_group_some,
    test_group_always,
    test_group_vacuous,

    writeln('===================================='),
    writeln('        ALL TESTS COMPLETED'),
    writeln('====================================').

% ============================================================================
% Formato general del test:
% test(Expected, QueryGoal, Description).
% ============================================================================

test(Expected, Goal, Description) :-
    (   call(Goal)
    ->  (Expected == true
        -> format('[PASS] ~w~n', [Description])
        ;  format('[FAIL] ~w  (expected false, got true)~n', [Description])
        )
    ;   (Expected == false
        -> format('[PASS] ~w~n', [Description])
        ;  format('[FAIL] ~w  (expected true, got false)~n', [Description])
        )
    ).


% ============================================================================
% GRUPO A — Pruebas de some/3 (Operador ◇)
% ============================================================================

test_group_some :-
    writeln('--- Grupo A: some/3 (◇) ---'),

    test(true,
         some(b, n1, m),
         'some(b, n1, m): b está en n2'),

    test(true,
         some(c, n1, m),
         'some(c, n1, m): c está en n3, prueba profundidad'),

    test(true,
         some(e, n1, m),
         'some(e, n1, m): e está en n5 (bifurcación + ciclo)'),

    test(false,
         some(start, n1, m),
         'some(start, n1, m): FUTURO ESTRICTO — start está solo en n1'),

    test(false,
         some(z, n1, m),
         'some(z, n1, m): z no existe'),

    test(false,
         some(a, n3, m),
         'some(a, n3, m): n3 es una hoja, no tiene futuro'), nl.



% ============================================================================
% GRUPO B — Pruebas de always/3 (Operador □)
% ============================================================================

test_group_always :-
    writeln('--- Grupo B: always/3 (□) ---'),

    test(true,
         always(a, n1, m),
         'always(a, n1, m): a en TODOS los futuros (n2, n3, n4, n5)'),

    test(false,
         always(b, n1, m),
         'always(b, n1, m): b no está en n4'),

    test(false,
         always(d, n4, m),
         'always(d, n4, m): n4 -> n5, pero n5 no contiene d'),

    test(true,
         always(a, n4, m),
         'always(a, n4, m): ciclo n4 <-> n5, ambos tienen a'), nl.



% ============================================================================
% GRUPO C — Casos Vacuously True
% ============================================================================

test_group_vacuous :-
    writeln('--- Grupo C: Vacuously True (hojas sin futuro) ---'),

    test(true,
         always(unicornio, n3, m),
         'always(unicornio, n3, m): n3 sin futuros, vacuous truth'),

    test(true,
         always(a, n3, m),
         'always(a, n3, m): vacuous truth (n3 sin sucesores)'), nl.