		.data
masa:	.double 75.0
alt:	.double 1.80
imc:	.double 0.0
inf:	.double 18.5
normal:	.double 25.0
obeso:	.double 30.0
estado:	.word 	0
		.text
		l.d f2, alt(r0)
		mul.d f2, f2,f2
		l.d f1, masa(r0)
		div.d f3, f1, f2
		l.d f4, inf(r0)
		s.d f3, imc(r0)
		c.le.d f3, f4
		bc1f seguir
		daddi r1, r0, 1
		j fin
seguir:	s.d f4, normal(r0)
		c.le.d f3, f4
		bc1f seguir2
		daddi r1, r0, 2
		j fin
segir2: s.d f4, obeso(r0)
		c.le.d f3.f4
		bc1f seguir3
		daddi r1, r0, 3
		j fin
seguir3: daddi r1, r0, 4
fin:	sb r1, estado(r0)
		halt

