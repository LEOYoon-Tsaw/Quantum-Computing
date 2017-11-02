OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg c0[3];
creg c1[3];
creg c2[3];
creg c3[3];

h q[2];
cx q[2],q[1];
cx q[2],q[0];
u3(-pi/2,0,0) q;
measure q -> c0;

reset q;
h q[2];
cx q[2],q[1];
cx q[2],q[0];
sdg q[0];
sdg q[1];
u3(-pi/2,0,0) q;
measure q -> c1;

reset q;
h q[2];
cx q[2],q[1];
cx q[2],q[0];
sdg q[1];
sdg q[2];
u3(-pi/2,0,0) q;
measure q -> c2;

reset q;
h q[2];
cx q[2],q[1];
cx q[2],q[0];
sdg q[0];
sdg q[2];
u3(-pi/2,0,0) q;
measure q -> c3;