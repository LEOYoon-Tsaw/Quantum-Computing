// Name of Experiment: Fourier Transformation v1

OPENQASM 2.0;
include "qelib1.inc";

qreg q[6];
qreg temp[3];
creg c[6];

h q;
cx q[3],temp[0];
cx q[4],temp[1];
cx q[5],temp[2];
reset temp;

h q[0];
cu1(pi/2) q[1],q[0];
cu1(pi/4) q[2],q[0];
cu1(pi/8) q[3],q[0];
cu1(pi/16) q[4],q[0];
cu1(pi/32) q[5],q[0];
h q[1];
cu1(pi/2) q[2],q[1];
cu1(pi/4) q[3],q[1];
cu1(pi/8) q[4],q[1];
cu1(pi/16) q[5],q[1];
h q[2];
cu1(pi/2) q[3],q[2];
cu1(pi/4) q[4],q[2];
cu1(pi/8) q[5],q[2];
h q[3];
cu1(pi/2) q[4],q[3];
cu1(pi/4) q[5],q[3];
h q[4];
cu1(pi/2) q[5],q[4];
h q[5];
measure q -> c;