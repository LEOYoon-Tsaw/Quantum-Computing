// Name of Experiment: adder v1

OPENQASM 2.0;
include "qelib1.inc";

qreg in[9];
qreg out[6];
creg c[4];

x in[0];
x in[1];
x in[2];
x in[4];
x in[7];

cx in[0],out[0];
ccx out[0],in[1],out[1];
cx in[1],out[0];
ccx out[0],in[2],out[1];
cx in[2],out[0];

ccx out[0],in[3],out[4];
ccx out[4],out[1],out[2];
cx out[4],out[1];
ccx out[0],in[3],out[4];
reset out[4];
cx in[3],out[0];

ccx out[0],in[4],out[4];
ccx out[4],out[1],out[2];
cx out[4],out[1];
ccx out[0],in[4],out[4];
reset out[4];
cx in[4],out[0];

ccx out[0],in[5],out[4];
ccx out[4],out[1],out[2];
cx out[4],out[1];
ccx out[0],in[5],out[4];
reset out[4];
cx in[5],out[0];

ccx out[0],in[6],out[4];
ccx out[4],out[1],out[2];
cx out[4],out[1];
ccx out[0],in[6],out[4];
reset out[4];
cx in[6],out[0];

ccx out[0],in[7],out[4];
ccx out[4],out[1],out[5];
ccx out[5],out[2],out[3];
cx out[5],out[2];
ccx out[4],out[1],out[5];
reset out[5];
cx out[4],out[1];
ccx out[0],in[7],out[4];
reset out[4];
cx in[7],out[0];

ccx out[0],in[8],out[4];
ccx out[4],out[1],out[5];
ccx out[5],out[2],out[3];
cx out[5],out[2];
ccx out[4],out[1],out[5];
reset out[5];
cx out[4],out[1];
ccx out[0],in[8],out[4];
reset out[4];
cx in[8],out[0];

measure out[0]->c[0];
measure out[1]->c[1];
measure out[2]->c[2];
measure out[3]->c[3];