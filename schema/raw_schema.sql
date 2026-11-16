CREATE TABLE staging.dataset_inventory_raw (
    dataset_code VARCHAR(20),
    dataset_name VARCHAR(255),
    crop_name VARCHAR(150),
    publisher VARCHAR(255),
    source_code VARCHAR(20),
    source_url TEXT,
    year INTEGER,
    license VARCHAR(255),
    accessed_at DATE
);

CREATE TABLE staging.unit_raw (
    unit_code VARCHAR(20),
    name VARCHAR(100),
    symbol VARCHAR(30),
    dimension VARCHAR(50),
    base_unit_code VARCHAR(20),
    conversion_factor DECIMAL(18,6)
);

CREATE TABLE staging.location_raw (
    location_code VARCHAR(20),
    name VARCHAR(150),
    location_type VARCHAR(20),
    parent_location_code VARCHAR(20),
    country_code VARCHAR(10),
    province_code VARCHAR(20)
);

CREATE TABLE staging.lci_raw (
    dataset_code VARCHAR(20),
    crop_name VARCHAR(150),
    process_name VARCHAR(255),
    location_name VARCHAR(150),
    reference_year INTEGER,
    system_boundary VARCHAR(255),
    reference_amount DECIMAL(20,6),
    reference_unit VARCHAR(30),
    flow_name VARCHAR(255),
    flow_type VARCHAR(50),
    direction VARCHAR(20),
    amount DECIMAL(20,6),
    unit VARCHAR(30),
    source_code VARCHAR(20)
);

CREATE TABLE staging.ag_stat_raw (
    dataset_code VARCHAR(20),
    crop_name VARCHAR(150),
    location_name VARCHAR(150),
    year INTEGER,
    month INTEGER,
    stat_type VARCHAR(50),
    value DECIMAL(20,4),
    unit VARCHAR(50),
    season VARCHAR(20)
);