killStreakTimeout = 4 -- UT99 specs.

killstreak = 0;
killcount = 0;
lastKillTime = 0;

function Sounds( Event, Entity )
	
	if ( Event:GetName() == 'player_death' ) then
		
		local ME = client.GetLocalPlayerIndex();
		
		local INT_UID = Event:GetInt( 'userid' );
		local INT_ATTACKER = Event:GetInt( 'attacker' );
		
		local NAME_Victim = client.GetPlayerNameByUserID( INT_UID );
		local INDEX_Victim = client.GetPlayerIndexByUserID( INT_UID );
		
		local NAME_Attacker = client.GetPlayerNameByUserID( INT_ATTACKER );
		local INDEX_Attacker = client.GetPlayerIndexByUserID( INT_ATTACKER );
		
		if ( INDEX_Attacker == ME and INDEX_Victim ~= ME ) then
			killcount = killcount + 1;
			killstreak = killstreak + 1;
			if ((globals.RealTime() - lastKillTime) < (killStreakTimeout)) then
				if ( killstreak == 2 ) then
					client.Command("play quake\\multi2.wav", true);
				elseif ( killstreak == 3) then
					client.Command("play quake\\multi3.wav", true);
				elseif ( killstreak == 4) then
					client.Command("play quake\\multi4.wav", true);
				elseif ( killstreak == 5) then
					client.Command("play quake\\multi5.wav", true);
				elseif ( killstreak == 6) then
					client.Command("play quake\\multi6.wav", true);
				elseif ( killstreak == 7) then
					client.Command("play quake\\multi7.wav", true);
				elseif ( killstreak == 8) then
					client.Command("play quake\\multi8.wav", true);
				elseif ( killstreak >= 9) then -- 9 or more kills plays same sound every time.
					client.Command("play quake\\multi9.wav", true);
				end
			else
				-- This scenario is when you kill someone outside the killStreakTimeout variable.
				killstreak = 1; 
			end
			
			if ( killcount > 0 ) then
				if ( killcount == 5 ) then
					client.Command("playvol quake\\streak5.wav 1", true);
				elseif ( killcount == 10 ) then 
					client.Command("playvol quake\\streak10.wav 1", true);
				elseif ( killcount == 15 ) then 
					client.Command("playvol quake\\streak15.wav 1", true);
				elseif ( killcount == 20 ) then 
					client.Command("playvol quake\\streak20.wav 1", true);
				elseif ( killcount % 5 == 0 ) then  -- play sound every 5 kills
					client.Command("playvol quake\\streak25.wav 1", true);
				end
			-- update time of last killed player at the end
			lastKillTime = globals.RealTime()
			end
		end
		
		if ( INDEX_Victim == ME ) then
			killstreak = 0;
			killcount = 0;
		end
	end
end

client.AllowListener( 'player_death' );
callbacks.Register( 'FireGameEvent', 'Announcer', Sounds );