-- Written by Joe Reid 

--battery indicator
batbox = widget({ type = "textbox" })
batbox.text = ""
 
function get_bat_stat()
    local file_desc = io.popen('acpi | cut -f2 -d"," | sed -e "s/[[:space:]]//g" | cut -f1 -d"%"')
    local stat = file_desc:read()
    file_desc:close()
 
    return stat  
end
 
function format_bat_stat()
    local stat = get_bat_stat()
 
    return stat .. '%'
end
 
 
batbox.text = format_bat_stat()
 
bat_timer = timer({ timeout = 60 })
bat_timer:add_signal("timeout", function() batbox.text = format_bat_stat() end)
bat_timer:start()
