SELECT kmfg       AS [MANUFACTURER]
     , kequipnum  AS [EQUIPMENT ID]
     , kmodel     AS [MODEL]
     , kserialno1 AS [SERIAL NUMBER]
     , eqmkready  AS [CODE]
     , int_flag_1 AS [FREQUENCY]
     , kbranch    AS [BRANCH]
     , kworkorder AS [LAST WORK ORDER NUMBER]
     , datelstbl  AS [LAST SM DATE]
     , lasthours  AS [LAST HOUR METER READING]
     , datenxtbl  AS [NEXT SM DATE]
     , pmsell     AS [FIXED RATE]
FROM eqmnt                                      /* SM Master Table   */
WHERE kcustnum IN ('RENT100'                    /* Cincinnati Rental */
                 , 'RENT200'                    /* Columbus Rental   */
                 , 'RENT300')                   /* Louisville Rental */