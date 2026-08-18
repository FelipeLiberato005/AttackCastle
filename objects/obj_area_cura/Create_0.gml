image_alpha = 0.5


curando_aliado = function()
{
    
    var list = array_length(global.personagens)
    
    for( var i = 0; i < list; i++)
    {
        var info = global.personagens[i]
        
        if(instance_exists(info.obj))
        {
            var _x = info.obj.x
            var _y = info.obj.y
        
            var toquei = place_meeting(x, y, info.obj)
        
            if toquei
            {
                info.vida_atual.ganha_vida(0.05)
            }    
        }
    }
}