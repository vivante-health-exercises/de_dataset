SELECT
    id
    ,weight
    ,height
    ,bmi
    ,(CASE WHEN pregnant = 1 THEN 'Yes'
        WHEN pregnant = 2 THEN 'No'
        WHEN pregnant = 3 THEN 'Unknown'
        ELSE NULL END) as pregnancy_status
    ,triglyceride_lab
    ,ldl_cholesterol_lab
    ,glucose_lab
    ,(CASE WHEN general_health = 1 THEN 'Excellent'
        WHEN general_health = 2 THEN 'Very Good'
        WHEN general_health = 3 THEN 'Good'
        WHEN general_health = 4 THEN 'Fair'
        WHEN general_health = 5 THEN 'Poor'
        WHEN general_health = 7 THEN NULL --Refused
        WHEN general_health = 9 THEN NULL --Don't Know
        ELSE NULL END) as general_health
    ,(CASE WHEN general_health_change = 1 THEN 'Better'
        WHEN general_health_change = 2 THEN 'Worse'
        WHEN general_health_change = 3 THEN 'About the same'
        ELSE NULL END) as general_health_change
FROM {{ ref('raw_data_nhanes_final')}}