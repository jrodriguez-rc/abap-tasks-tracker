class ZCL_ZTT_C_TASKS definition
  public
  inheriting from CL_SADL_GTK_EXPOSURE_MPC
  final
  create public .

public section.
protected section.

  methods GET_PATHS
    redefinition .
  methods GET_TIMESTAMP
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZTT_C_TASKS IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( `CDS~ZTT_C_TASKS` )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20200709175135.
  endmethod.
ENDCLASS.
