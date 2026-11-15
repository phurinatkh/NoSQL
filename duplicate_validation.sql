WITH duplicate_checks AS (
    SELECT 'SOURCE' AS table_name, COUNT(*) AS duplicate_groups
    FROM (
        SELECT source_code
        FROM public.source
        GROUP BY source_code
        HAVING COUNT(*) > 1
    ) x

    UNION ALL

    SELECT 'DATASET', COUNT(*)
    FROM (
        SELECT dataset_code
        FROM public.dataset
        GROUP BY dataset_code
        HAVING COUNT(*) > 1
    ) x

    UNION ALL

    SELECT 'CROP', COUNT(*)
    FROM (
        SELECT name
        FROM public.crop
        GROUP BY name
        HAVING COUNT(*) > 1
    ) x

    UNION ALL

    SELECT 'LOCATION', COUNT(*)
    FROM (
        SELECT name, location_type, parent_location_id
        FROM public.location
        GROUP BY name, location_type, parent_location_id
        HAVING COUNT(*) > 1
    ) x

    UNION ALL

    SELECT 'UNIT', COUNT(*)
    FROM (
        SELECT symbol
        FROM public.unit
        WHERE symbol IS NOT NULL
        GROUP BY symbol
        HAVING COUNT(*) > 1
    ) x

    UNION ALL

    SELECT 'PROCESS', COUNT(*)
    FROM (
        SELECT dataset_id, crop_id, location_id,
               name, reference_year
        FROM public.process
        GROUP BY dataset_id, crop_id, location_id,
                 name, reference_year
        HAVING COUNT(*) > 1
    ) x

    UNION ALL

    SELECT 'FLOW', COUNT(*)
    FROM (
        SELECT name, flow_type
        FROM public.flow
        GROUP BY name, flow_type
        HAVING COUNT(*) > 1
    ) x

    UNION ALL

    SELECT 'LCI_EXCHANGE', COUNT(*)
    FROM (
        SELECT process_id, flow_id, unit_id,
               source_id, direction, amount, data_year
        FROM public.lci_exchange
        GROUP BY process_id, flow_id, unit_id,
                 source_id, direction, amount, data_year
        HAVING COUNT(*) > 1
    ) x

    UNION ALL

    SELECT 'AGRICULTURAL_STAT', COUNT(*)
    FROM (
        SELECT dataset_id, crop_id, location_id,
               unit_id, year, month, stat_type, season
        FROM public.agricultural_stat
        GROUP BY dataset_id, crop_id, location_id,
                 unit_id, year, month, stat_type, season
        HAVING COUNT(*) > 1
    ) x
)
SELECT
    table_name,
    duplicate_groups,
    CASE
        WHEN duplicate_groups = 0 THEN 'PASS'
        ELSE 'REVIEW'
    END AS validation_status
FROM duplicate_checks
ORDER BY table_name;