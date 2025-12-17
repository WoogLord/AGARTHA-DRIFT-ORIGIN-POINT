function musicManager()
    musPlayGameDefault:setVolume(musicVolume) -- change this to be iterative
    sfxTitleLogoVocal:setVolume(musicVolume)
    musTitleScreen:setVolume(musicVolume)
    musTitleLoadCutscene:setVolume(musicVolume)
    if CurrentState == "MainMenu" then
        if not musTitleLoadCutscene:isPlaying() then
            if not musTitleScreen:isPlaying() then
                sfxTitleLogoVocal:play()
                musTitleScreen:play()
            end
        end
    elseif CurrentState == "Play" then
        playerControls()
        if not musPlayGameDefault:isPlaying() then
            musTitleScreen:stop()
            musTitleLoadCutscene:stop()
            musPlayGameDefault:play()
        end
        if player.inBattle then 
            musPlayGameDefault:stop()
            musBattle:play()
        end
    end
end