SELECT
    'INVALID_EXCHANGE_DIRECTION' AS check_name,
    COUNT(*) AS affected_records
FROM public.lci_exchange
WHERE direction NOT IN ('IN', 'OUT')

UNION ALL

SELECT 'INVALID_EXCHANGE_AMOUNT', COUNT(*)
FROM public.lci_exchange
WHERE amount <= 0

UNION ALL

SELECT 'INVALID_REFERENCE_AMOUNT', COUNT(*)
FROM public.process
WHERE reference_amount <= 0

UNION ALL

SELECT 'MISSING_REFERENCE_FLOW', COUNT(*)
FROM public.process
WHERE reference_flow_id IS NULL

UNION ALL

SELECT 'INVALID_STAT_MONTH', COUNT(*)
FROM public.agricultural_stat
WHERE month IS NOT NULL
  AND (month < 1 OR month > 12)

UNION ALL

SELECT 'INVALID_STAT_YEAR', COUNT(*)
FROM public.agricultural_stat
WHERE year <= 0;