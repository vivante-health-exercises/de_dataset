SELECT
    id
    ,(CASE WHEN gender = 1 THEN 'Male'
        WHEN gender = 2 THEN 'Female'
        ELSE NULL END) as gender
    ,age
    ,(CASE WHEN race_ethnicity = 1 THEN 'Mexican American'
        WHEN race_ethnicity = 2 THEN 'Other Hispanic'
        WHEN race_ethnicity = 3 THEN 'Non-hispanic White'
        WHEN race_ethnicity = 4 THEN 'Non-hispanic Black'
        WHEN race_ethnicity = 5 THEN 'Non-hispanic Asian'
        WHEN race_ethnicity = 7 THEN 'Other Race/Multiracial'
        ELSE NULL END) as race_ethnicity
    ,(CASE WHEN active_duty_veteran = 1 THEN 'Yes'
        WHEN active_duty_veteran = 2 THEN 'No'
        WHEN active_duty_veteran = 7 THEN NULL --Refused
        WHEN active_duty_veteran = 9 THEN NULL --Don't Know
        ELSE NULL END) as active_duty_veteran
    ,(CASE WHEN education_adult = 1 THEN 'Less than 9th grade'
        WHEN education_adult = 2 THEN '9-11th grade'
        WHEN education_adult = 3 THEN 'HS Graduate/GED'
        WHEN education_adult = 4 THEN 'Some College/AA Degree'
        WHEN education_adult = 5 THEN 'College graduate'
        WHEN education_adult = 7 THEN NULL --Refused
        WHEN education_adult = 9 THEN NULL --Don't Know
        ELSE NULL END) as education_adult
    ,(CASE WHEN marital_status = 1 THEN 'Married'
        WHEN marital_status = 2 THEN 'Widowed'
        WHEN marital_status = 3 THEN 'Divorced'
        WHEN marital_status = 4 THEN 'Separated'
        WHEN marital_status = 5 THEN 'Never Married'
        WHEN marital_status = 6 THEN 'Living with partner'
        WHEN marital_status = 77 THEN NULL --Refused
        WHEN marital_status = 99 THEN NULL --Don't Know
        ELSE NULL END) as marital_Status
    ,(CASE WHEN household_income = 1 THEN 'Less than 5K'
        WHEN household_income = 2 THEN '5 to < 10K'
        WHEN household_income = 3 THEN '10 to < 15K'
        WHEN household_income = 4 THEN '15 to < 20K'
        WHEN household_income = 5 THEN '20 to < 25K'
        WHEN household_income = 6 THEN '25 to < 35K'
        WHEN household_income = 7 THEN '35 to < 45K'
        WHEN household_income = 8 THEN '45 to < 55K'
        WHEN household_income = 9 THEN '55 to < 65K'
        WHEN household_income = 10 THEN '65 to < 75K'
        WHEN household_income = 12 THEN '20K+'
        WHEN household_income = 13 THEN '< 20K'
        WHEN household_income = 14 THEN '75 to < 100K'
        WHEN household_income = 15 THEN '100K+'
        WHEN household_income = 77 THEN NULL --Refused
        WHEN household_income = 99 THEN NULL --Don't Know
        ELSE NULL END) as household_income
    ,household_size
FROM {{ ref('raw_data_nhanes_final')}}