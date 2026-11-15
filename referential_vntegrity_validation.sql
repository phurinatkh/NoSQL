SELECT 'PROCESS -> CROP' AS relationship,
       COUNT(*) AS invalid_references
FROM public.process p
LEFT JOIN public.crop c ON p.crop_id = c.crop_id
WHERE p.crop_id IS NOT NULL AND c.crop_id IS NULL

UNION ALL
SELECT 'PROCESS -> DATASET', COUNT(*)
FROM public.process p
LEFT JOIN public.dataset d ON p.dataset_id = d.dataset_id
WHERE p.dataset_id IS NOT NULL AND d.dataset_id IS NULL

UNION ALL
SELECT 'PROCESS -> LOCATION', COUNT(*)
FROM public.process p
LEFT JOIN public.location l ON p.location_id = l.location_id
WHERE p.location_id IS NOT NULL AND l.location_id IS NULL

UNION ALL
SELECT 'PROCESS -> REFERENCE FLOW', COUNT(*)
FROM public.process p
LEFT JOIN public.flow f ON p.reference_flow_id = f.flow_id
WHERE p.reference_flow_id IS NOT NULL AND f.flow_id IS NULL

UNION ALL
SELECT 'LCI_EXCHANGE -> PROCESS', COUNT(*)
FROM public.lci_exchange e
LEFT JOIN public.process p ON e.process_id = p.process_id
WHERE p.process_id IS NULL

UNION ALL
SELECT 'LCI_EXCHANGE -> FLOW', COUNT(*)
FROM public.lci_exchange e
LEFT JOIN public.flow f ON e.flow_id = f.flow_id
WHERE f.flow_id IS NULL

UNION ALL
SELECT 'LCI_EXCHANGE -> UNIT', COUNT(*)
FROM public.lci_exchange e
LEFT JOIN public.unit u ON e.unit_id = u.unit_id
WHERE u.unit_id IS NULL

UNION ALL
SELECT 'LCI_EXCHANGE -> SOURCE', COUNT(*)
FROM public.lci_exchange e
LEFT JOIN public.source s ON e.source_id = s.source_id
WHERE e.source_id IS NOT NULL AND s.source_id IS NULL

UNION ALL
SELECT 'AGRICULTURAL_STAT -> CROP', COUNT(*)
FROM public.agricultural_stat a
LEFT JOIN public.crop c ON a.crop_id = c.crop_id
WHERE c.crop_id IS NULL

UNION ALL
SELECT 'AGRICULTURAL_STAT -> DATASET', COUNT(*)
FROM public.agricultural_stat a
LEFT JOIN public.dataset d ON a.dataset_id = d.dataset_id
WHERE d.dataset_id IS NULL;