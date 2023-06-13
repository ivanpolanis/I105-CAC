        .data
base:	.double 5.85
h: 		.double 13.47
s:		.double 0.0
n2:		.double 2.0
		.text
		l.d f1, base(r0)
		l.d f2, h(r0)
		mul.d f3,f1,f2
		l.d f1, n2(r0)
		div.d f4, f3,f1
		s.d f4, s(r0)
		halt