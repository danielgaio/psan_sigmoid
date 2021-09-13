transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/danielgaio/Documents/GitHub/psan_sigmoid/hdl {/home/danielgaio/Documents/GitHub/psan_sigmoid/hdl/psan_sigmoid.sv}

