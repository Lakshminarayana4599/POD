CLASS zi_serviceorders DEFINITION
  PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
ENDCLASS.


CLASS zi_serviceorders IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA :  ls_sales TYPE zservice_report,
            lt_sales type standard table of zservice_report.

    ls_sales-vbeln         = '0000000008'.
    ls_sales-erdat         = '20260317'.
    ls_sales-pod_date      = '20260320'.
    ls_sales-pgi_date      = '20260318'.
    ls_sales-pgi_status    = 'done'.
    ls_sales-pod_status    = 'completed'.
    ls_sales-delivery_type = 'express'.


    INSERT zservice_report FROM @ls_sales.



    out->write( |Inserted VBELN { ls_sales-vbeln } into zservice_report| ).

  ENDMETHOD.

ENDCLASS.

