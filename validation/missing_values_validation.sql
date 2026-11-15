SELECT 'SOURCE' AS table_name,
       COUNT(*) FILTER (
           WHERE source_code IS NULL OR title IS NULL
       ) AS invalid_records
FROM public.source

UNION ALL
SELECT 'DATASET',
       COUNT(*) FILTER (
           WHERE dataset_code IS NULL
              OR source_id IS NULL
              OR title IS NULL
       )
FROM public.dataset

UNION ALL
SELECT 'CROP',
       COUNT(*) FILTER (WHERE name IS NULL)
FROM public.crop

UNION ALL
SELECT 'LOCATION',
       COUNT(*) FILTER (
           WHERE name IS NULL OR location_type IS NULL
       )
FROM public.location

UNION ALL
SELECT 'UNIT',
       COUNT(*) FILTER (WHERE name IS NULL)
FROM public.unit

UNION ALL
SELECT 'PROCESS',
       COUNT(*) FILTER (WHERE name IS NULL)
FROM public.process

UNION ALL
SELECT 'FLOW',
       COUNT(*) FILTER (WHERE name IS NULL)
FROM public.flow

UNION ALL
SELECT 'LCI_EXCHANGE',
       COUNT(*) FILTER (
           WHERE process_id IS NULL
              OR flow_id IS NULL
              OR unit_id IS NULL
              OR direction IS NULL
              OR amount IS NULL
       )
FROM public.lci_exchange

UNION ALL
SELECT 'AGRICULTURAL_STAT',
       COUNT(*) FILTER (
           WHERE crop_id IS NULL
              OR location_id IS NULL
              OR dataset_id IS NULL
              OR unit_id IS NULL
              OR year IS NULL
              OR stat_type IS NULL
              OR value IS NULL
       )
FROM public.agricultural_stat;
