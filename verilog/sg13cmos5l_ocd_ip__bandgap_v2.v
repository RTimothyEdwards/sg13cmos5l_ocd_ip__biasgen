/* Behavioral verilog model for the bandgap.
 * This model produces a real-valued output based on the circuit
 * function and digital inputs.
 */

module sg13cmos5l_ocd_ip__bandgap_v2 (
    `ifdef USE_POWER_PINS
	inout wire dvdd,
	inout wire dvss,
	inout wire vdd,
	inout wire vss,
    `endif 

    input wire ena,		// Circuit enable
    input wire [15:0] trim,	// Thermometer code

    input wire real ibias1_250n,	// Current bias
    input wire real ibias2_1,		// Current bias

    output wire real vbg		// Bandgap voltage out
);

/* Bias range check.
 *
 * The circuit behaviour has only been characterised with ibias1_250n at
 * -250 nA and ibias2_1 at -1 uA;  away from those the output below means
 * nothing, so a testbench that quietly supplies something else is
 * measuring a number the model is not entitled to produce.
 *
 * The check is a flag rather than a clamp or an error.  Clamping would
 * hide a misconnection, and $error would stop a run that may be
 * deliberately sweeping the trim.  bias_ok is readable from a testbench
 * (cocotb reads it directly), and the warning fires only while the
 * block is enabled, because an unbiased disabled bandgap is normal.
 *
 * NaN fails the check, which is intended:  every comparison against NaN
 * is false, so an unconnected bias reads as out of range rather than as
 * a pass.
 */
localparam real IBIAS1_NOM = -250e-9;
localparam real IBIAS2_NOM = -1e-6;
localparam real BIAS_TOL   = 0.10;	/* fractional, on each bias */

/* NOMINALS ARE NEGATIVE, so the "low" bound is the more negative one. */
wire bias1_ok = (ibias1_250n >= IBIAS1_NOM * (1.0 + BIAS_TOL)) &&
		(ibias1_250n <= IBIAS1_NOM * (1.0 - BIAS_TOL));
wire bias2_ok = (ibias2_1    >= IBIAS2_NOM * (1.0 + BIAS_TOL)) &&
		(ibias2_1    <= IBIAS2_NOM * (1.0 - BIAS_TOL));

wire bias_ok = bias1_ok & bias2_ok;

always @(bias_ok or ena) begin
    if ((ena === 1'b1) && (bias_ok !== 1'b1))
	$display("WARNING: %m at %0t: bandgap bias out of range: ibias1_250n = %g A (want %g +/-%0.0f%%), ibias2_1 = %g A (want %g)",
		 $time, ibias1_250n, IBIAS1_NOM, BIAS_TOL * 100.0,
		 ibias2_1, IBIAS2_NOM);
end

/* Circuit behavior:  The actual trim is not linear and needs to be
 * simulated and curve-fit.  The following equation is linearized
 * between the endpoints (trim = all zeros and trim = all ones).
 */

wire [4:0] j = $countones(trim);
/* Three-way rather than a plain ternary, and === rather than ==.
 *
 * For these blocks 0.0 is a LEGITIMATE value:  a disabled bandgap or
 * bias generator really does sit at ground, unlike a disconnected
 * switch.  So the off state must stay 0.0 and cannot be NaN.
 *
 * That makes an unknown enable dangerous:  with ==, the comparison is x
 * and a ternary with an x condition collapses to 0.0 on real operands,
 * which is indistinguishable from a deliberately disabled block.  The
 * third branch says what is actually true --- enable unknown, output
 * unknown --- and NaN propagates so it cannot be mistaken downstream.
 */
localparam real NAN = 0.0/0.0;

assign vbg = (ena === 1'b1) ? (0.96688 + j * 0.0203) :
	     (ena === 1'b0) ? 0.0 : NAN;

endmodule
