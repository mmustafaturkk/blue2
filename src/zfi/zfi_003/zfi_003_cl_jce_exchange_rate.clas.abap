CLASS zfi_003_cl_jce_exchange_rate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_apj_dt_exec_object .
    INTERFACES if_apj_rt_exec_object .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZFI_003_CL_JCE_EXCHANGE_RATE IMPLEMENTATION.


  METHOD if_apj_dt_exec_object~get_parameters.
*    CLEAR: et_parameter_val, et_parameter_def.
*    et_parameter_def = VALUE #(
*                ( selname = cl_eam_apj_matl_availy_check=>ordertype kind = 'S' datatype = 'C' component_type = 'MAINTENANCEORDERTYPE' length = '4'  decimals = '0' param_text ='Maintenance Order Type'(001) changeable_ind = 'X' )
*                ( selname = cl_eam_apj_matl_availy_check=>maintenanceplanningplant kind = 'S' datatype = 'C' component_type = 'MAINTENANCEPLANNINGPLANT' length = '4'  decimals = '0' param_text = 'Maintenance Planning Plant'(002) changeable_ind = 'X'  )
*                ( selname = cl_eam_apj_matl_availy_check=>maintenanceactivitytype kind = 'S' datatype = 'C' component_type = 'ILA' length = '3' decimals = '0' param_text = 'Maintenance Activity Type'(003) changeable_ind = 'X' )
*                ( selname = cl_eam_apj_matl_availy_check=>basicstartdate kind = 'S' datatype = 'D' component_type = 'PM_ORDGSTRP' length = '8'  param_text = 'Scheduled Start Date'(004) changeable_ind = 'X' )
*                ( selname = cl_eam_apj_matl_availy_check=>basicenddate kind = 'S' datatype = 'D' component_type = 'CO_GLTRP' length = '8' param_text = 'Scheduled End Date'(005) changeable_ind = 'X' )
*                ( selname = cl_eam_apj_matl_availy_check=>executionstage kind = 'S' datatype = 'C' component_type = 'EAM_PREMAINPOST_GROUP' length = '4' param_text = 'Execution Stage'(006) changeable_ind = 'X' )
*                ( selname = cl_eam_apj_matl_availy_check=>materialgroup kind = 'S' datatype = 'C' component_type = 'MATKL' length = '9' param_text = 'Material Group'(007) changeable_ind = 'X' )
*                ( selname = cl_eam_apj_matl_availy_check=>resetavailabilitydata datatype = 'C' component_type = 'ABAP_BOOLEAN' length = '1' param_text = 'Reset Availability Data'(008) changeable_ind = 'X' checkbox_ind = 'X' )
*                ( selname = cl_eam_apj_matl_availy_check=>executeavailabilitycheck datatype = 'C' component_type = 'ABAP_BOOLEAN' length = '1' param_text = 'Execute Availability Check'(009)  changeable_ind = 'X' checkbox_ind = 'X' )
*                ( selname = cl_eam_apj_matl_availy_check=>eamprocessphasecode kind = 'S' datatype = 'C' component_type = 'EAM_OSTAT_PHASE'  length = '2' param_text = 'Process Phase'(010) changeable_ind = 'X' )
*                ( selname = cl_eam_apj_matl_availy_check=>materialstatus kind = 'S' datatype = 'C' component_type = 'J_STATUS' length = '5' param_text = 'Material Status'(011) changeable_ind = 'X' hidden_ind = 'X' )
*                ( selname = cl_eam_apj_matl_availy_check=>daterange kind = 'S' datatype = 'C' component_type = 'RELATIVEDATEFUNCTION' length = '32'  param_text = 'Relative Scheduled Date'(012) changeable_ind = 'X' ) ).

  ENDMETHOD.


  METHOD if_apj_rt_exec_object~execute.
*    DATA: ls_bal_msg              TYPE bal_s_msg,
*          lo_cl_pm_bal_log        TYPE REF TO cl_pm_bal_log,
*          lt_orderid              TYPE cl_eam_apj_matl_avail_chk_log=>tt_orderid,
*          lt_orderid_current_set  TYPE cl_eam_apj_matl_avail_chk_log=>tt_orderid,
*          lt_ord_comp_current_set TYPE if_eam_matl_availy_chck_mng=>tt_order_component.
*
***********************************************************************
*    " Select Components with Orders based on the input parameters
*
*    DATA(lo_matl_avail_chck_manage) = cl_eam_apj_atp_factory=>get_matl_avail_chck_manage( ).
*    lo_matl_avail_chck_manage->select_components(
*      EXPORTING
*        it_parameter       = it_parameters
*      IMPORTING
*        et_order_component = DATA(lt_order_component)
*    ).
*
*    MOVE lt_order_component TO lt_orderid.
*    SORT lt_orderid.
*    DELETE ADJACENT DUPLICATES FROM lt_orderid.
*    DESCRIBE TABLE lt_order_component LINES DATA(number_of_components).
*    CHECK lt_order_component[] IS NOT INITIAL.
*    "Collect the parameter configuration
*    READ TABLE it_parameters WITH KEY selname = resetavailabilitydata INTO DATA(ls_resetavailabilitydata).
*    READ TABLE it_parameters WITH KEY selname = executeavailabilitycheck INTO DATA(ls_executeavailabilitycheck).
*
*    IF ls_resetavailabilitydata-low = abap_true AND ls_executeavailabilitycheck-low = abap_false.
*      "Switch off the material availability check during the posting of the orders
*      matl_avbl_chck_apj_is_ongoing = abap_true.
*    ENDIF.
*
*    organize_comps_for_atp_check(
*    EXPORTING
*      iv_executeavailabilitycheck = CONV abap_bool( ls_executeavailabilitycheck-low )
*      iv_resetavailabilitydata    = CONV abap_bool( ls_resetavailabilitydata-low )
*      it_orderdid                 = lt_orderid
*    CHANGING
*      ct_order_component          = lt_order_component
*      cv_number_of_components     = number_of_components
*      ).
*
*    " Log the results
*    me->generate_log( ).
  ENDMETHOD.
ENDCLASS.
