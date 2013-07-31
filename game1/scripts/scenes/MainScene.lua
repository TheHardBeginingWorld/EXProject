
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    local label = ui.newEditBox({
        image = "EditBoxBg.png",
        size = CCSize(400, 96),
        x = display.cx,
        y = display.cy,
        -- align = ui.TEXT_ALIGN_CENTER,
        listener = function ()
            self:onTouch()
            -- 方法全部用: 属性全部用.
            -- 错误示范self.onTouch()
        end
    })

    self:addChild(label)
    self.text = (ui.newTTFLabel({
        text = "TAP SCREEN",
        size = 32,
        x = display.cx,
        y = display.cy,
        align = ui.TEXT_ALIGN_CENTER
    }))
    self:addChild(self.text)
end

function MainScene:onTouch()
    self.text:setPosition(100,100)
    printf(100000)
    return
end

function MainScene:onEnter()
    if device.platform ~= "android" then return end

    -- avoid unmeant back
    self:performWithDelay(function()
        --audio.playMusic(MUSIC.backgroundMusic, true)
        -- keypad layer, for android
        local layer = display.newLayer()
        layer:addKeypadEventListener(function(event)
            if event == "back" then game.exit() end
        end)
        self:addChild(layer)

        layer:setKeypadEnabled(true)
    end, 0.5)

    -- self.touchLayer:registerScriptTouchHandle(function(event, x, y)
    --     return self.onTouch(event, x, y)
    -- end)
    -- self.touchLayer:setTouchEnabled(true)
end

return MainScene
