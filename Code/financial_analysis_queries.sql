-- Asian Paints: illustrative research queries
CREATE TABLE financials (
    fiscal_year VARCHAR(10),
    revenue_crore DECIMAL(18,2),
    ebitda_crore DECIMAL(18,2),
    pat_crore DECIMAL(18,2),
    cfo_crore DECIMAL(18,2)
);

-- Earnings growth and cash conversion
SELECT fiscal_year,
       revenue_crore,
       ebitda_crore,
       pat_crore,
       cfo_crore,
       ROUND(ebitda_crore / NULLIF(revenue_crore,0) * 100,2) AS ebitda_margin_pct,
       ROUND(pat_crore / NULLIF(revenue_crore,0) * 100,2) AS pat_margin_pct,
       ROUND(cfo_crore / NULLIF(pat_crore,0),2) AS cfo_to_pat
FROM financials
ORDER BY fiscal_year;

-- Years where operating cash flow materially exceeded accounting profit
SELECT fiscal_year, cfo_crore, pat_crore,
       ROUND(cfo_crore - pat_crore,2) AS cash_minus_pat
FROM financials
WHERE cfo_crore > pat_crore
ORDER BY cash_minus_pat DESC;
