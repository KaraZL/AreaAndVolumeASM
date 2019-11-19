.model flat,c
.const
NumberPi	real8	3.14159
Four		real8	4.0
Three		real8	3.0

.code
AreaCalculation		proc ;sse
					push ebp
					mov ebp, esp
	
					movsd xmm0, real8 ptr [ebp+8]
					mov edx, [ebp+16] ;pointer
					movsd xmm1, real8 ptr [NumberPi]
					movsd xmm2, real8 ptr [Four]

					xorpd xmm7, xmm7
					comisd xmm0,xmm7
					jbe IncorrectValue

					mulsd xmm0, xmm0
					mulsd xmm1, xmm2
					mulsd xmm0, xmm1

					movsd real8 ptr [edx], xmm0


IncorrectValue:
					mov esp, ebp
					pop ebp
					ret

AreaCalculation		endp

VolumeCalculation	proc ;avx
					
					push ebp
					mov ebp, esp

					vmovsd xmm0, real8 ptr [ebp+8]
					mov edx, [ebp+16]
					vmovsd xmm1, real8 ptr [NumberPi]
					vmovsd xmm2, real8 ptr [Four]
					vdivsd xmm2, xmm2, real8 ptr [Three]

					xorpd xmm7, xmm7
					comisd xmm0, xmm7
					jbe IncorrectValue
					
					vmulsd xmm3, xmm0, xmm0
					vmulsd xmm0, xmm3, xmm0
					vmulsd xmm0, xmm0, xmm1
					vmulsd xmm0, xmm0, xmm2

					vmovsd real8 ptr [edx], xmm0

IncorrectValue:
					mov esp, ebp
					pop ebp
					ret

VolumeCalculation	endp
					end
