CLASS lhc_serviceorder DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR serviceorder RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR serviceorder RESULT result.
    METHODS updatepod FOR MODIFY
      IMPORTING keys FOR ACTION serviceorder~updatepod RESULT result.

ENDCLASS.

CLASS lhc_serviceorder IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD updatePOD.
  read entities of zi_serviceorder in local mode
  entity serviceorder
  all fields with corresponding #( keys )
  result data(serviceorderdata).

  loop at serviceorderdata into data(ls_order).
    if ls_order-PgiDate <> ls_order-Erdat and ls_order-Erdat is not initial.
    ls_order-Erdat = ls_order-PgiDate.
    endif.
  endloop.

  modify entities of zi_serviceorder in local mode
  entity serviceorder
  UPDATE fields ( Erdat ) with value #( ( %tky-Vbeln = ls_order-vbeln Erdat = ls_order-PgiDate  ) )
  mapped data(ls_mapped)
  reported data(ls_reported).

  result = value #(
  for rec in serviceorderdata (
  %tky = rec-%tky
  %param = rec
  )
  ).

  ENDMETHOD.

ENDCLASS.
