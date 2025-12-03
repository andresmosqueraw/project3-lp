#!/bin/bash
# ============================================================================
# Script para ejecutar tests de las tareas
# ============================================================================

# Colores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

cd "$(dirname "$0")"

echo -e "${YELLOW}========================================${NC}"
echo -e "${YELLOW}Ejecutando Tests Automáticos${NC}"
echo -e "${YELLOW}========================================${NC}"
echo ""

# Cargar test_suite.pl (grafo de prueba), task2.pl, task3.pl y test-automatic.pl
swipl -g "['task1.pl','task2.pl','task3.pl','test_suite.pl', 'test-automatic.pl'], run_tests, halt." 2>&1

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}Tests Completados${NC}"
echo -e "${GREEN}========================================${NC}"

