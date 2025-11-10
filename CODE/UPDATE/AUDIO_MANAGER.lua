function musicManager()
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
    end
end