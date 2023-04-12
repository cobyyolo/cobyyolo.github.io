frequency = 0.5 -- range: [0, oo) | lower is slower
intensity = 255 -- range: [0, 255] | lower is darker
saturation = 1 -- range: [0.00, 1.00] | lower is less saturated

function hsvToR(h, s, v)
  local r, g, b

  local i = math.floor(h * 6);
  local f = h * 6 - i;
  local p = v * (1 - s);
  local q = v * (1 - f * s);
  local t = v * (1 - (1 - f) * s);

  i = i % 6

  if i == 0 then r, g, b = v, t, p
  elseif i == 1 then r, g, b = q, v, p
  elseif i == 2 then r, g, b = p, v, t
  elseif i == 3 then r, g, b = p, q, v
  elseif i == 4 then r, g, b = t, p, v
  elseif i == 5 then r, g, b = v, p, q
  end

  return r * intensity
end

function hsvToG(h, s, v)
  local r, g, b

  local i = math.floor(h * 6);
  local f = h * 6 - i;
  local p = v * (1 - s);
  local q = v * (1 - f * s);
  local t = v * (1 - (1 - f) * s);

  i = i % 6

  if i == 0 then r, g, b = v, t, p
  elseif i == 1 then r, g, b = q, v, p
  elseif i == 2 then r, g, b = p, v, t
  elseif i == 3 then r, g, b = p, q, v
  elseif i == 4 then r, g, b = t, p, v
  elseif i == 5 then r, g, b = v, p, q
  end

  return g * intensity
end

function hsvToB(h, s, v)
  local r, g, b

  local i = math.floor(h * 6);
  local f = h * 6 - i;
  local p = v * (1 - s);
  local q = v * (1 - f * s);
  local t = v * (1 - (1 - f) * s);

  i = i % 6

  if i == 0 then r, g, b = v, t, p
  elseif i == 1 then r, g, b = q, v, p
  elseif i == 2 then r, g, b = p, v, t
  elseif i == 3 then r, g, b = p, q, v
  elseif i == 4 then r, g, b = t, p, v
  elseif i == 5 then r, g, b = v, p, q
  end

  return b * intensity
end

function rainbowesp()
    local R = hsvToR((globals.RealTime() * frequency) % 1, saturation, 1)
	local G = hsvToG((globals.RealTime() * frequency) % 1, saturation, 1)
	local B = hsvToB((globals.RealTime() * frequency) % 1, saturation, 1)
	gui.SetValue( "clr_chams_ct_invis", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_chams_ct_vis", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_chams_weapon_primary", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_chams_weapon_secondary", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_esp_bar_ammo1", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_esp_bar_ammo2", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_esp_bar_armor1", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_esp_bar_armor2", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_esp_bar_health1", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_esp_bar_health2", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_esp_bar_lbytimer1", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_esp_bar_lbytimer2", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_esp_box_ct_invis", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_chams_ghost_fake", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_chams_ghost_lby", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_chams_hands_primary", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_chams_hands_secondary", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_chams_historyticks", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_chams_other_invis", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_chams_other_vis", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_chams_t_invis", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_chams_t_vis", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_esp_box_ct_vis", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_esp_box_other_invis", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_esp_box_other_vis", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_esp_box_t_invis", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_esp_box_t_vis", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_esp_crosshair", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_esp_crosshair_recoil", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_esp_outofview", math.floor(R), math.floor(G), math.floor(B), 255)
	gui.SetValue( "clr_misc_hitmarker", math.floor(R), math.floor(G), math.floor(B), 255)
end

callbacks.Register( "Draw", "rainbowesp", rainbowesp);