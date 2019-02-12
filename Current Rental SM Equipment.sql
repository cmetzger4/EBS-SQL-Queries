SELECT eqmnt.kmfg       AS [MANUFACTURER]
     , eqmnt.kequipnum  AS [EQUIPMENT ID]
     , eqmnt.kmodel     AS [MODEL]
     , eqmnt.kserialno1 AS [SERIAL NUMBER]
     , eqmnt.eqmkready  AS [LABOR CODE]
     , eqmnt.int_flag_1 AS [FREQUENCY]
     , eqmnt.kbranch    AS [BRANCH]
     , eqmnt.kworkorder AS [LAST WORK ORDER NUMBER]
     , eqmnt.datelstbl  AS [LAST SM DATE]
     , eqmnt.lasthours  AS [LAST HOUR METER READING]
     , eqmnt.datenxtbl  AS [NEXT SM DATE]
     , eqmnt.pmsell     AS [FIXED RATE]
     , eqmnt.kworkorder AS [LAST PM WORK ORDER NUMBER]
     , ardetl.ardate    AS [INVOICE DATE]
FROM eqmnt                                            /* SM Master Table   */
LEFT OUTER JOIN wohead                                /* Work Order Header Table */
             ON eqmnt.kworkorder = wohead.kworkorder
            AND eqmnt.kbranch = wohead.kbranch
LEFT OUTER JOIN ardetl                                /* Accounts Receivable Detail Table */
             ON wohead.arinvno = ardetl.arinvno
            AND wohead.kbranch = ardetl.arbranch
            AND ardetl.artype = 1                     /* Type: Invoice */
WHERE eqmnt.kcustnum IN ('RENT100'                    /* Cincinnati Rental */
                       , 'RENT200'                    /* Columbus Rental   */
                       , 'RENT300')                   /* Louisville Rental */