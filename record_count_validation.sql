SELECT 'SOURCE' AS table_name, COUNT(*) AS total_records FROM public.source
UNION ALL SELECT 'DATASET', COUNT(*) FROM public.dataset
UNION ALL SELECT 'CROP', COUNT(*) FROM public.crop
UNION ALL SELECT 'AGRICULTURAL_STAT', COUNT(*) FROM public.agricultural_stat
UNION ALL SELECT 'LOCATION', COUNT(*) FROM public.location
UNION ALL SELECT 'UNIT', COUNT(*) FROM public.unit
UNION ALL SELECT 'PROCESS', COUNT(*) FROM public.process
UNION ALL SELECT 'FLOW', COUNT(*) FROM public.flow
UNION ALL SELECT 'LCI_EXCHANGE', COUNT(*) FROM public.lci_exchange
ORDER BY table_name;