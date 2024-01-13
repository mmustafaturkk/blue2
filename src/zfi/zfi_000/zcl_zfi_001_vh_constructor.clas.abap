CLASS zcl_zfi_001_vh_constructor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_oo_adt_classrun.
    METHODS : constructor,
      instance_method.
    CLASS-METHODS : class_constructor,
      static_method.
ENDCLASS.



CLASS ZCL_ZFI_001_VH_CONSTRUCTOR IMPLEMENTATION.


  METHOD class_constructor.
    "Method Code
  ENDMETHOD.


  METHOD constructor.
    "Method Code

  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    DATA: ls_test TYPE zfi_000_t_dbtcrd,
          lt_test TYPE TABLE OF zfi_000_t_dbtcrd.
    ls_test-text = 'S'.
    ls_test-description = 'S'.
    APPEND ls_test TO lt_test.
    ls_test-text = 'H'.
    ls_test-description = 'H'.
    APPEND ls_test TO lt_test.
    MODIFY zfi_000_t_dbtcrd FROM TABLE @lt_test.
  ENDMETHOD.


  METHOD instance_method.
    "Method Code

  ENDMETHOD.


  METHOD static_method.
    "Method Code
  ENDMETHOD.
ENDCLASS.
