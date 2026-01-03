UPDATE dbo.Countries
SET VAT = v.VAT
FROM dbo.Countries c
JOIN (VALUES
  (1, 10),  -- Australia (GST)
  (2, 20),  -- Austria
  (3, 18),  -- Azerbaijan
  (4, 17),  -- Brazil
  (5, 20),  -- Bulgaria
  (6, 13),  -- China
  (7, 25),  -- Denmark
  (8, 20),  -- France
  (9, 19),  -- Germany
  (10, 23), -- Greece
  (11, 0),  -- Hong Kong (no VAT/GST)
  (12, 10), -- Japan
  (13, 10), -- Korea Republic of
  (14, 0),  -- Kuwait (no VAT)
  (15, 21), -- Latvia
  (16, 0),  -- Macau (no VAT/GST)
  (17, 21), -- Netherlands
  (18, 25), -- Norway
  (19, 23), -- Portugal
  (20, 20), -- Russian Federation
  (21, 15), -- Saudi Arabia
  (22, 9),  -- Singapore
  (23, 5),  -- Taiwan
  (24, 0),  -- Turks and Caicos Islands (no VAT)
  (25, 20), -- Ukraine
  (26, 20), -- United Kingdom
  (27, 0)   -- United States (no VAT)
) AS v(CountryId, VAT) ON v.CountryId = c.CountryId;