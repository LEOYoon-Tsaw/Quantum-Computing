// Name of Experiment: modular adder v1

OPENQASM 2.0;
include "qelib1.inc";

qreg a[2];
qreg b[3];
qreg c[2];
qreg d[1];
creg r[3];

x b[1]; x b[0];
x a[1];
x c;

// add a to b then substract c
h b[2];
cu1(pi/2) b[1],b[2];
cu1(pi/4) b[0],b[2];
h b[1];
cu1(pi/2) b[0],b[1];
h b[0];

cu1(pi/2) a[1],b[2];
cu1(pi/4) a[0],b[2];
cu1(pi) a[1],b[1];
cu1(pi/2) a[0],b[1];
cu1(pi) a[0],b[0];

cu1(-pi) c[0],b[0];
cu1(-pi/2) c[0],b[1];
cu1(-pi) c[1],b[1];
cu1(-pi/4) c[0],b[2];
cu1(-pi/2) c[1],b[2];

h b[0];
cu1(-pi/2) b[0],b[1];
h b[1];
cu1(-pi/4) b[0],b[2];
cu1(-pi/2) b[1],b[2];
h b[2];

// determine whether a+b-c < 0, if not, set c to |0>
cx b[2],d[0];
x d[0];
cx d[0],c[0];
cx d[0],c[1];

// add back c if  a+b-c < 0 and then substract a
h b[2];
cu1(pi/2) b[1],b[2];
cu1(pi/4) b[0],b[2];
h b[1];
cu1(pi/2) b[0],b[1];
h b[0];

cu1(pi/2) c[1],b[2];
cu1(pi/4) c[0],b[2];
cu1(pi) c[1],b[1];
cu1(pi/2) c[0],b[1];
cu1(pi) c[0],b[0];

cu1(-pi) a[0],b[0];
cu1(-pi/2) a[0],b[1];
cu1(-pi) a[1],b[1];
cu1(-pi/4) a[0],b[2];
cu1(-pi/2) a[1],b[2];

h b[0];
cu1(-pi/2) b[0],b[1];
h b[1];
cu1(-pi/4) b[0],b[2];
cu1(-pi/2) b[1],b[2];
h b[2];

// restore c and the sign bit(d)
cx d[0],c[0];
cx d[0],c[1];
cx b[2],d[0];

// add back a
h b[2];
cu1(pi/2) b[1],b[2];
cu1(pi/4) b[0],b[2];
h b[1];
cu1(pi/2) b[0],b[1];
h b[0];

cu1(pi/2) a[1],b[2];
cu1(pi/4) a[0],b[2];
cu1(pi) a[1],b[1];
cu1(pi/2) a[0],b[1];
cu1(pi) a[0],b[0];

h b[0];
cu1(-pi/2) b[0],b[1];
h b[1];
cu1(-pi/4) b[0],b[2];
cu1(-pi/2) b[1],b[2];
h b[2];

measure b -> r;
