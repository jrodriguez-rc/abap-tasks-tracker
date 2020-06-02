class ZCL_ZTT_VH_TIME_UNIT definition
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



CLASS ZCL_ZTT_VH_TIME_UNIT IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( `CDS~ZTT_VH_TIME_UNIT` )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20200601160640.
  endmethod.
ENDCLASS.
