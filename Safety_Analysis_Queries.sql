SELECT * FROM lnt_safety_analytics_final;


SELECT 
helemt_frequency,
COUNT(*) AS riders,
ROUND(
COUNT(*)*100/(SELECT COUNT(*) FROM safety_survey),
2
) AS percentage
FROM lnt_safety_analytics_final
GROUP BY helemt_frequency;

SELECT
risk_category,
COUNT(*) AS riders
FROM lnt_safety_analytics_final
GROUP BY risk_category;

SELECT

age_group,

AVG(helemt_compliance_score)
AS avg_score

FROM lnt_safety_analytics_final

GROUP BY age_group;

SELECT

behaviour_gap,

COUNT(*) AS riders

GROUP BY behaviour_gap;

SELECT
respondent_id,
age,
helemt_frequency,
awareness_score
FROM lnt_safety_analytics_final
WHERE risk_category='High Risk';

SELECT
respondent_id,
age,
helemt_compliance_score,
RANK() OVER(
ORDER BY helemt_compliance_score DESC
)
AS safety_rank
FROM lnt_safety_analytics_final;