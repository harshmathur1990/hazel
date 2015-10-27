function i0_allen, wl, mu

   ic = fltarr(2,43)
   ic[0,*] = [0.20,0.22,0.24,0.26,0.28,0.30,0.32,0.34,0.36,0.37,0.38,0.39,0.40,0.41,0.42,0.43,0.44,0.45,0.46,0.48,0.50,0.55,0.60,0.65,0.70,0.75,$
      0.80,0.90,1.00,1.10,1.20,1.40,1.60,1.80,2.00,2.50,3.00,4.00,5.00,6.00,8.00,10.0,12.0]
   ic[1,*] = [0.06,0.21,0.29,0.60,1.30,2.45,3.25,3.77,4.13,4.23,4.63,4.95,5.15,5.26,5.28,5.24,5.19,5.10,5.00,4.79,4.55,4.02,3.52,3.06,2.69,2.28,2.03,$
      1.57,1.26,1.01,0.81,0.53,0.36,0.238,0.160,0.078,0.041,0.0142,0.0062,0.0032,0.00095,0.00035,0.00018]

   cl = fltarr(3,22)
   cl[0,*] = [0.20,0.22,0.245,0.265,0.28,0.30,0.32,0.35,0.37,0.38,0.40,0.45,0.50,0.55,0.60,0.80,1.0,1.5,2.0,3.0,5.0,10.0]
   cl[1,*] = [0.12,-1.3,-0.1,-0.1,0.38,0.74,0.88,0.98,1.03,0.92,0.91,0.99,0.97,0.93,0.88,0.73,0.64,0.57,0.48,0.35,0.22,0.15]
   cl[2,*] = [0.33,1.6,0.85,0.90,0.57, 0.20, 0.03,-0.1,-0.16,-0.05,-0.05,-0.17,-0.22,-0.23,-0.23,-0.22,-0.20,-0.21,-0.18,-0.12,-0.07,-0.07]

   PC = 2.99792458d10
   PH = 6.62606876d-27

; Wavelength in A
   ic(0,*) = 1.d4 * ic(0,*)
; I_lambda to I_nu
   ic(1,*) = 1.d14 * ic(1,*) * (ic(0,*)*1.d-8)^2 / PC

   cl(0,*) = 1.d4 * cl(0,*)

   u = interpol(cl(1,*),cl(0,*),wl)
   v = interpol(cl(2,*),cl(0,*),wl)
   i0 = interpol(ic(1,*),ic(0,*),wl)

   imu = 1.d0 - u - v + u * mu + v * mu^2
   
   return, i0*imu
end
