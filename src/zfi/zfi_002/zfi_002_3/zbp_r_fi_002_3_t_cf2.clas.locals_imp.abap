CLASS LHC_ZR_FI_002_3_T_CF2 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZR_FI_002_3_T_CF2
        RESULT result.
ENDCLASS.

CLASS LHC_ZR_FI_002_3_T_CF2 IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
ENDCLASS.