pro test, n, sh
	x = findgen(N) / (n-1.d0) * 8.
	y = exp(-(x-3)^2)

	k = fltarr(n)
	for i = 1, n do begin
   	k[i-1] = i-1
   endfor

   n21 = n/2+1
   
   for i = n21+1, n do begin
   	k[i-1] = n21-n+(i-1-n21)
   endfor

   k = 2.d0*!DPI*k/(1.d0*n)
   k = k * complex(0.d0,1.d0)

   ff = fft(y, -1)

   fft_shift = float(fft(ff * exp(-k*sh), 1))

   plot, x, y
   oplot, x, fft_shift
   verx, 3.d0
   verx, 3.d0+(x[1]-x[0])*sh

	stop
end