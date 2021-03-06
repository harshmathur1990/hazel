;-----------------------------------------
; Event handler
;-----------------------------------------
pro hazel_Event, event
	 widget_control, Event.id, GET_UVALUE=Action
	 
	 hand = widget_info(Event.Handler, /CHILD)
	 widget_control, hand, GET_UVALUE=state
	 
	 case Action of
	 	  'Calculate' : 	begin
		   		 	   		 synthesize, state, hand, /plot_profiles		   		 	   		 
		   		 	   	end
		  'FIELD_VARIATION' : 	begin
		   		 	   		 calculate_field_variation, state
		   		 	   	end
	 	  'LOAD_OBSERVATION' : 	begin
		   		 	   		 state.obs_file = dialog_pickfile(default_extension='.prof')
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
		  'RESET_OBSERVATION' : 	begin
		   		 	   		 state.obs_file = ''
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end						  
		  'BSlider' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.Bfield = value
									 widget_control, hand, SET_UVALUE=state
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end
		  'BSlider2' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.Bfield2 = value
									 widget_control, hand, SET_UVALUE=state
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end
	 	  'BSliderMax' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.Bfieldmax = value
									 widget_control, hand, SET_UVALUE=state
									 widget_control, state.Bslider, SET_VALUE=[state.Bfield, 0, state.Bfieldmax]
									 widget_control, state.Bslider, GET_VALUE=value
									 state.Bfield = value
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
		  'BSliderMax2' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.Bfieldmax2 = value
									 widget_control, hand, SET_UVALUE=state
									 widget_control, state.Bslider2, SET_VALUE=[state.Bfield2, 0, state.Bfieldmax2]
									 widget_control, state.Bslider2, GET_VALUE=value
									 state.Bfield2 = value
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
	 	  'thetaBSlider' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.thetaBfield = value
									 widget_control, hand, SET_UVALUE=state
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end
		  'thetaBSlider2' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.thetaBfield2 = value
									 widget_control, hand, SET_UVALUE=state
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end
	 	  'chiBSlider' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.chiBfield = value
									 widget_control, hand, SET_UVALUE=state
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end
		  'chiBSlider2' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.chiBfield2 = value
									 widget_control, hand, SET_UVALUE=state
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end
	 	  'thetaOSlider' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.thetaObs = value									 
									 widget_control, hand, SET_UVALUE=state
									 I0 = return_i0_allen(state)
									 if (state.useAllen eq 1) then begin
									 	widget_control, state.i0_allen, SET_VALUE=strtrim(string(i0),2)
									 endif
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end
	 	  'chiOSlider' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.chiObs = value
									 widget_control, hand, SET_UVALUE=state
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end
	 	  'gammaOSlider' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.gammaObs = value
									 widget_control, hand, SET_UVALUE=state
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end
	 	  'MultipletSlider' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.Multiplet = value
									 widget_control, hand, SET_UVALUE=state
									 I0 = return_i0_allen(state)
									 widget_control, state.i0_allen, SET_VALUE='Allen: '+strtrim(string(i0),2)
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end
	 	  'DopplerSlider' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.Doppler = value
									 widget_control, hand, SET_UVALUE=state
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end
		  'DopplerSlider2' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.Doppler2 = value
									 widget_control, hand, SET_UVALUE=state
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end
	 	  'heightSlider' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.height = value
									 widget_control, hand, SET_UVALUE=state
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end
	 	  'AUTO_ON' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.auto = 1
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
	 	  'AUTO_OFF' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.auto = 0
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
	 	  'PS_ON' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.postcript = 1
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
	 	  'PS_OFF' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.postcript = 0
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
		  'PS_WRITE' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.postcript = 2
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
		  'RANDOMAZI_ON' :  begin
		  								widget_control, Event.id, GET_VALUE=value
		   		 	   		   state.randomazimuth = 1
									   widget_control, hand, SET_UVALUE=state
		  						end
		  'RANDOMAZI_OFF' :  begin
		  								widget_control, Event.id, GET_VALUE=value
		   		 	   		   state.randomazimuth = 0
									   widget_control, hand, SET_UVALUE=state
		  						end
	 	  'PASCHEN' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.paschen = 1
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
	 	  'LINEAR' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.paschen = 0
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
	 	  'ALL' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.effects = 0
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
	 	  'ZEEMAN' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.effects = 1
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
		  'NOANISOT' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.effects = 2
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
	 	  'EMISSION' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.observation = 0
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
	 	  'TANGENTIAL' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.observation = -1
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
	 	  'FORMAL' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.observation = 1
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
		  'DELOPAR' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.observation = 3
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
		  'EXACT_SLAB' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.observation = 5
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
	 	  'MILNE' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.observation = 2
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
	 	  'SIMPLE_SLAB' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.observation = 4
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
	 	  'I0' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.stokes0[0] = value
									 widget_control, Event.id, SET_VALUE=strtrim(string(value,FORMAT='(E10.4)'),2)
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
		  'wleft' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.waveaxis[0] = value
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
		  'wright' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.waveaxis[1] = value
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
		  'wstep' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.waveaxis[2] = value
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
	 	  'Q0' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.stokes0[1] = value
									 widget_control, Event.id, SET_VALUE=strtrim(string(value,FORMAT='(E10.4)'),2)
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
	 	  'U0' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.stokes0[2] = value
									 widget_control, Event.id, SET_VALUE=strtrim(string(value,FORMAT='(E10.4)'),2)
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
	 	  'V0' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.stokes0[3] = value
									 widget_control, Event.id, SET_VALUE=strtrim(string(value,FORMAT='(E10.4)'),2)
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
	 	  'DTAU1' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.dtau_desired = value
									 widget_control, hand, SET_UVALUE=state
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end
		  'DTAU2' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.dtau_desired2 = value
									 widget_control, hand, SET_UVALUE=state
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end
		  'VEL1' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.vel = value
									 widget_control, hand, SET_UVALUE=state
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end
		  'VEL2' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.vel2 = value
									 widget_control, hand, SET_UVALUE=state
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end  
	 	  'SE1' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.beta = value
									 widget_control, hand, SET_UVALUE=state
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end 
		  'SE2' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.beta2 = value
									 widget_control, hand, SET_UVALUE=state
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end 
	 	  'DAMPING' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.damping = value
									 widget_control, hand, SET_UVALUE=state
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end
		  'FF' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.ff = value
									 widget_control, hand, SET_UVALUE=state
									 if (state.auto eq 1) then synthesize, state, hand, /plot_profiles
		   		 	   	end
	 	  'STIM' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.stimulated = 1
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
	 	  'NOSTIM' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.stimulated = 0
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
	 	  'MAGNETOOPT' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.magneto_opt = 1
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
		  'MAXIMUM' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.normaliz = 1
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
		  'ABSORPTION' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.normaliz = 0
									 widget_control, hand, SET_UVALUE=state
							end
		  'CONTINUUM' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.normaliz = 2
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
	 	  'NOMAGNETOOPT' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.magneto_opt = 0
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
		  'D2' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.D2 = value
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
		  'fact_10830_w' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.factor_10830_omega = value
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
		  'fact_10830_nbar' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.factor_10830_nbar = value
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
		  'j10_tensor' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.j10 = value
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
		  'HELIUM' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.which_atom = 0
									 state.multiplet = 1
									 state.which_code = 0
									 widget_control, hand, SET_UVALUE=state
									 widget_control, state.MultipletSlider, SET_SLIDER_MAX=4
									 widget_control, state.MultipletSlider, SET_VALUE=1
									 widget_control, state.MultipletSlider, sensitive=1
									 widget_control, state.baseWidget, $
									 	BASE_SET_TITLE='Hanle Simulator : He I'
		   		 	   	end
		  'CALCIUM' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.which_atom = 1
									 state.multiplet = 1
									 state.which_code = 0
									 widget_control, hand, SET_UVALUE=state
									 widget_control, state.MultipletSlider, SET_SLIDER_MAX=2
									 widget_control, state.MultipletSlider, SET_VALUE=1
									 widget_control, state.MultipletSlider, sensitive=1
									 widget_control, state.baseWidget, $
									 	BASE_SET_TITLE='Hanle Simulator : Ca II'
		   		 	   	end
		   'SODIUM' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.which_atom = 2
									 state.multiplet = 1
									 state.which_code = 0
									 widget_control, hand, SET_UVALUE=state
									 widget_control, state.MultipletSlider, SET_SLIDER_MAX=1
									 widget_control, state.MultipletSlider, SET_VALUE=1
									 widget_control, state.MultipletSlider, sensitive=0
									 widget_control, state.baseWidget, $
									 	BASE_SET_TITLE='Hanle Simulator : Na I'
		   		 	   	end
		   'SODIUM_HFS' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.which_atom = 0
									 state.multiplet = 1
									 state.which_code = 1
									 widget_control, hand, SET_UVALUE=state
									 widget_control, state.MultipletSlider, SET_SLIDER_MAX=2
									 widget_control, state.MultipletSlider, SET_VALUE=1
									 widget_control, state.MultipletSlider, sensitive=1
									 widget_control, state.baseWidget, $
									 	BASE_SET_TITLE='Hanle Simulator : Na I HFS'
		   		 	   	end
		   'NFIELDS_RHO' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.bfield_var[2] = value
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
		   'BMIN_RHO' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.bfield_var[0] = value
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
		  	'BMAX_RHO' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.bfield_var[1] = value
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end 
		   'NONDIAGONAL' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.which_rho_plot = 0
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
		   'DIAGONAL' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.which_rho_plot = 1
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
		   'VERTICAL_REFFRAME' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.which_refframe = 0
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end
		   'MAGNETIC_REFFRAME' : 	begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 state.which_refframe = 1
									 widget_control, hand, SET_UVALUE=state
		   		 	   	end    
		   'tableSigma' : begin
		   		 	   		 widget_control, Event.id, GET_VALUE=value
		   		 	   		 
		   		 	   	end
		    'ONE_SLAB' : begin
		    						state.number_slabs = 1
		    						widget_control, hand, SET_UVALUE=state
		    				  end
		    'TWO_SLABS' : begin
		    						state.number_slabs = 2
		    						widget_control, hand, SET_UVALUE=state
		    				  end
		    'TWO_SLABS_DIFFIELD' : begin
		    						state.number_slabs = 3
		    						widget_control, hand, SET_UVALUE=state
		    				  end
		    'TWO_SLABS_COMPO' : begin
		    						state.number_slabs = -2
		    						widget_control, hand, SET_UVALUE=state
		    				  end
		    'USEALLEN': begin
		    				if (event.select eq 1) then begin
		    					state.useAllen = 1
		    					I0 = return_i0_allen(state)
							 	widget_control, state.i0_allen, SET_VALUE=strtrim(string(i0),2)							 	
		    				endif else begin
		    					state.useAllen = 0
		    				endelse		    				
		    				widget_control, hand, SET_UVALUE=state
		    			end


	 endcase
	 save, state, filename='state.idl'
end