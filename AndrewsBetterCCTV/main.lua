Citizen.CreateThread( function()
updatePath = "/AndrewTheWusky/versionChecker/blob/main/versionCheck"
resourceName = "Andrews Better CCTV ("..GetCurrentResourceName()..")"

function checkVersion(err,responseText, headers)
	curVersion = LoadResourceFile(GetCurrentResourceName(), "ABCCTV")

	if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
		print("\n###############################")
		print("\n"..resourceName.." is outdated, should be:\n"..responseText.."is:\n"..curVersion.."\nplease update it from https://github.com"..updatePath.."")
		print("\n###############################")
	elseif tonumber(curVersion) > tonumber(responseText) then
		print("You somehow skipped a few versions of "..resourceName.." or the git went offline, if it's still online i advise you to update ( or downgrade? )")
	else
		print("\n"..resourceName.." is up to date, no need to update!")
	end
end

PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/master/version", checkVersion, "GET")
end)