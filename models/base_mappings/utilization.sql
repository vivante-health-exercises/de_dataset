SELECT
    id
    ,(CASE WHEN routine_healthcare_place = 1 THEN 'Yes'
        WHEN routine_healthcare_place = 2 THEN 'There is no place'
        WHEN routine_healthcare_place = 3 THEN 'There is more than one place'
        WHEN routine_healthcare_place = 7 THEN NULL --Refused
        WHEN routine_healthcare_place = 9 THEN NULL --Don't Know
        ELSE NULL END) as routine_healthcare_place
    ,(CASE WHEN preferred_healthcare_place = 1 THEN 'Clinic/Health Center'
        WHEN preferred_healthcare_place = 2 THEN 'Doctor Office/HMO'
        WHEN preferred_healthcare_place = 3 THEN 'Hospital ER'
        WHEN preferred_healthcare_place = 4 THEN 'Hospital Outpatient'
        WHEN preferred_healthcare_place = 5 THEN 'Other Place'
        WHEN preferred_healthcare_place = 6 THEN 'Does not go to one place most often'
        WHEN preferred_healthcare_place = 77 THEN NULL --Refused
        WHEN preferred_healthcare_place = 99 THEN NULL --Don't Know
        ELSE NULL END) as preferred_healthcare_place
    ,(CASE WHEN last_healthcare_visit = 1 THEN '6 months or less'
        WHEN last_healthcare_visit = 2 THEN '6 months to < 1yr'
        WHEN last_healthcare_visit = 3 THEN '1yr to < 2yrs'
        WHEN last_healthcare_visit = 4 THEN '2 yrs to < 5yrs'
        WHEN last_healthcare_visit = 5 THEN '> 5 yrs'
        WHEN last_healthcare_visit = 6 THEN 'Never'
        WHEN last_healthcare_visit = 77 THEN NULL
        WHEN last_healthcare_visit = 99 THEN NULL
        ELSE NULL END) as last_healthcare_visit
    ,(CASE WHEN healthcare_visit_ct = 1 THEN '1'
        WHEN healthcare_visit_ct = 2 THEN '2-3'
        WHEN healthcare_visit_ct = 3 THEN '4-5'
        WHEN healthcare_visit_ct = 4 THEN '6-7'
        WHEN healthcare_visit_ct = 5 THEN '8-9'
        WHEN healthcare_visit_ct = 6 THEN '10-12'
        WHEN healthcare_visit_ct = 7 THEN '13-15'
        WHEN healthcare_visit_ct = 8 THEN '16+'
        WHEN healthcare_visit_ct = 77 THEN NULL
        WHEN healthcare_visit_ct = 99 THEN NULL
        ELSE NULL END) as healthcare_visit_ct
    ,(CASE WHEN overnight_hospital_stay = 1 THEN 'Yes'
        WHEN overnight_hospital_stay = 2 THEN 'No'
        WHEN overnight_hospital_stay = 7 THEN NULL
        WHEN overnight_hospital_stay = 9 THEN NULL
        ELSE NULL END) as overnight_hospital_stay
    ,(CASE WHEN overnight_hospital_stay_ct = 77777 THEN NULL --Refused
        WHEN overnight_hospital_stay_ct = 99999 THEN NULL --Don't Know
        ELSE overnight_hospital_stay_ct END) as overnight_hospital_stay_ct
    ,(CASE WHEN mental_health_visit = 1 THEN 'Yes'
        WHEN mental_health_visit = 2 THEN 'No'
        WHEN mental_health_visit = 7 THEN NULL
        WHEN mental_health_visit = 9 THEN NULL END) as mental_health_visit
FROM {{ ref('raw_data_nhanes_final')}}